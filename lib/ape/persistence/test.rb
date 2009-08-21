module Ape
  module Persistence
    class Test < Abstract
      
      class << self
        attr_accessor :on_synchronize, :on_restore
      end
      
      def synchronize!(source)
        logger.debug [:synchronize!, Time.now, source, self.store]
        self.store = Marshal.dump(source)
        self.class.on_synchronize.call if self.class.on_synchronize.respond_to?(:call)
      end
      
      def restore!(source)
        logger.debug [:restore!, Time.now, source, self.store]
        source.replace(Marshal.load(self.store)) unless self.store.nil?
        self.class.on_restore.call if self.class.on_restore.respond_to?(:call)
      end
      
    end
  end
end
