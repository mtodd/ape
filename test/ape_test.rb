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
  
  def test_can_extend_an_existing_object_to_persist_itself
    Ape::Persistence::Test.on_synchronize = lambda{ $synced += 1 }
    
    $synced = 0
    a = []
    a.extend(WithAsyncPersistence(:Test, "test.file"))
    a << 1
    sleep 0.1
    assert $synced > 0
  end
  
end
