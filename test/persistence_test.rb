require 'test_helper'

class PersistentArray < Array
  include Ape::AsyncPersistence
  async_persist :Test, "tmp/test.obj"
end

class PersistenceTest < Test::Unit::TestCase
  
  def test_should_persist_changes
    a = PersistentArray.new
    a << 1
    a << 2
    
    sleep 0.1
    
    assert_equal [1,2], Marshal.load(store_for(a))
  end
  
  def test_should_restore_persisted_changes
    PersistentArray.__ape_persistor.store = Marshal.dump([1,2,3])
    
    a = PersistentArray.new
    
    assert_equal [1,2,3], Marshal.load(store_for(a))
  end
  
end
