require 'logger'

module Ape
  
  class << self
    attr_accessor :logger
  end
  @logger = begin
    logger = ::Logger.new(STDOUT)
    logger.level = ::Logger::DEBUG
    logger
  end
  
  module Logger
    def logger
      Ape.logger
    end
    def self.included(target)
      target.extend ClassMethods
    end
    module ClassMethods
      def logger
        Ape.logger
      end
    end
  end
  
end
