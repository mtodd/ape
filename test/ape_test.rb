require 'test_helper'

class ApeTestArray < Array; end

class ApeTest < Test::Unit::TestCase
  
  def test_should_add_async_persist_class_function
    ApeTestArray.send(:include, Ape::AsyncPersistence)
    assert ApeTestArray.respond_to?(:async_persist)
  end
  
  def test_async_persist_sets_up_a_persistor
    ApeTestArray.send(:include, Ape::AsyncPersistence)
    ApeTestArray.async_persist :Test, "tmp/test.obj"
    assert ApeTestArray.__ape_persistor.is_a?(Ape::Persistence::Abstract)
  end
  
end
