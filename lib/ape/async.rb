module Ape
  module Async
    include Ape::Logger
    
    def initialize(*args)
      super
      persist!(self)
    end
    
    def self.included(target)
      target.send(:attr_accessor, :__ape_timer)
    end
    
    def persist!(obj)
      if EM.reactor_running? && self.class.respond_to?(:__ape_persistor)
        EM.add_periodic_timer(self.class.__ape_options[:frequency]){
          self.class.__ape_persistor.synchronize!(obj)
        }
      end
    end
    
  end
end
