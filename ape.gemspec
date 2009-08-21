Gem::Specification.new do |s|
  s.name              = 'ape'
  s.version           = "0.1.0"
  
  s.authors           = ['Matt Todd']
  s.email             = 'mtodd@highgroove.com'
  
  s.summary           = "Asynchronously Persist Ruby Objects to Disk"
  s.description       = 'A library to enable the asynchronous persistence of Ruby objects to disk'
  s.homepage          = "http://github.com/mtodd/ape"
  
  s.files             = ["lib/ape.rb", "lib/ape/async.rb", "lib/ape/logger.rb", "lib/ape/persistence.rb", "lib/ape/persistence/abstract.rb", "lib/ape/persistence/file.rb", "lib/ape/persistence/null.rb", "lib/ape/persistence/pstore.rb", "lib/ape/persistence/test.rb", "test/ape_test.rb", "test/async_test.rb", "test/persistence_test.rb", "test/test_helper.rb"]
  s.test_files        = ["test/ape_test.rb", "test/async_test.rb", "test/persistence_test.rb"]
  s.require_path      = 'lib'
end
