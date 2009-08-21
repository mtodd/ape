module Ape
  module Persistence
    class File < Abstract
      
      def initialize(options)
        self.options = options
        # self.store = ::File.new(filename, "w+")
      end
      
      def synchronize!(source)
        p [:synchronize!, Time.now, source, self.store]
        p [:file, ::File.read(self.options[:file])]
        ::File.open(self.options[:file], "w+") do |f|
          f.write(Marshal.dump(source))
        end
        p [:file, ::File.read(self.options[:file])]
      end
      
      def restore!(source)
        p [:restore!, Time.now, source, self.store]
        return unless ::File.exist?(self.options[:file])
        source.replace(Marshal.load(::File.read(self.options[:file])))
      end
      
    end
  end
end
