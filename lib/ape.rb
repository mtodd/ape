$:.unshift(File.expand_path(File.dirname(__FILE__)))

require 'eventmachine'

require 'ape/logger'

require 'ape/async'
require 'ape/persistence'

module Ape
  include Ape::Logger
  
  VERSION = [0,0,0].join('.')
  
  class << self
    attr_accessor :default_options
  end
  @default_options = {
    :frequency => 1 # second
  }
  
  module AsyncPersistence
    def initialize(*args)
      super
      begin
        self.class.__ape_persistor.restore!(self)
      rescue Exception => e
        logger.error "ERROR: Unable to restore object from persisted cache"
        logger.error "\t%s" % e.message
        logger.error "\t%s" % e.backtrace.join("\n\t")
      end
    end
    
    def self.included(target)
      target.extend ClassMethods
      class << target
        attr_accessor :__ape_options
      end
      target.__ape_options = Ape.default_options.dup
    end
    
    module ClassMethods
      def async_persist(persistor, file = nil, options = {})
        self.__ape_options.merge!(Ape.default_options.merge({:persistor => persistor, :file => file}.merge(options)))
        self.send(:include, Ape::Async)
        self.send(:include, Ape::Persistence)
      end
    end
  end
  
  def self.start_reactor!
    Thread.new do
      begin
        EM.run{}
      rescue Exception => e
        logger.error "ERROR: Unable to start EventMachine reactor"
        logger.error "\t%s" % e.message
        logger.error "\t%s" % e.backtrace.join("\n\t")
      end
    end
  end
  
end

Ape.start_reactor!