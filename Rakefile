# encoding: utf-8
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "easily_typable"
  gem.homepage = "http://github.com/AndyObtiva/easily_typable"
  gem.license = "MIT"
  gem.summary = %Q{Ruby mixin that facilitates English-like type checking in an inheritance hierarchy via "type_name?" methods}
  gem.description = %Q{Ruby mixin that facilitates English-like type checking in an inheritance hierarchy via "type_name?" methods}
  gem.email = "andy.am@gmail.com"
  gem.authors = ["AndyObtiva"]
  gem.files = Dir['lib/*.rb']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "easily_typable #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
