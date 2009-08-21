require 'test_helper'

class Persisted
  include Ape::AsyncPersistence
  async_persist :Test, nil
end

class AsyncTest < Test::Unit::TestCase
  
  def test_persisted_is_synchronized_frequently
    Ape::Persistence::Test.on_synchronize = lambda{ $synced += 1 }
    
    $synced = 0
    p = Persisted.new
    sleep 0.1
    assert $synced > 0
  end
  
end
