module Ape
  module Persistence
    class Abstract
      include Ape::Logger
      
      attr_accessor :options, :store
      
      def initialize(options)
        self.options = options
      end
      
      def synchronize!(source)
        raise NotImplementedError
      end
      
      def restore!(source)
        raise NotImplementedError
      end
      
    end
  end
end
