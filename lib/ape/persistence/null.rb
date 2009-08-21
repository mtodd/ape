module Ape
  module Persistence
    class Null < Abstract
      
      class NullSet; def method_missing(*_); true; end; end
      
      def initialize
        self.store = NullSet.new
      end
      
      def synchronize!(source)
        p [:synchronize!, Time.now, source, self.store]
      end
      
      def restore!(source)
        p [:restore!, Time.now, source, self.store]
      end
      
    end
  end
end
