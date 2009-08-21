module Ape
  module Persistence
    class File < Abstract
      
      def synchronize!(source)
        logger.debug [:synchronize!, Time.now, source, self.store]
        ::File.open(self.options[:file], "w+") do |f|
          f.write(Marshal.dump(source))
        end
      end
      
      def restore!(source)
        logger.debug [:restore!, Time.now, source, self.store]
        return unless ::File.exist?(self.options[:file])
        source.replace(Marshal.load(::File.read(self.options[:file])))
      end
      
    end
  end
end
