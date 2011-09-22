require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  #test.ruby_opts << '-rubygems'
  test.pattern = FileList['test/**/test_*.rb'].exclude('test/test_helper.rb')
  test.verbose = true
end
