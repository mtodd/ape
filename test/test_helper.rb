$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'

require 'test/unit'
require 'ape'

Ape.logger.level = Logger::INFO
Ape.default_options[:frequency] = 0 # so there's no delay for testing

class Test::Unit::TestCase
  include Ape::Logger
  
  def store_for(obj)
    obj.class.__ape_persistor.store
  end
  
end
