module Ape
  module Persistence
    include Ape::Logger
    
    autoload :Abstract, 'ape/persistence/abstract'
    autoload :Null,     'ape/persistence/null'
    autoload :Test,     'ape/persistence/test'
    autoload :File,     'ape/persistence/file'
    autoload :PStore,   'ape/persistence/pstore'
    
    def self.included(target)
      class << target
        attr_accessor :__ape_persistor
      end
      target.__ape_persistor = self.const_get(target.__ape_options[:persistor] || :Null).new(target.__ape_options)
    end
    
  end
end
