$:.unshift('lib')
$:.unshift('test')

require 'rake/testtask'
require 'rake/gempackagetask'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

spec = eval("SAFE=1; #{File.read("ape.gemspec")}")

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true
  p.gem_spec = spec
end

task :default => [:test]
