require 'pstore'

module Ape
  module Persistence
    class PStore < Abstract
      
      def initialize(filename)
        self.store = ::PStore.new(filename)
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
