# encoding: utf-8
if RUBY_VERSION >= '1.9' && !defined?(Rubinius) && (ARGV.empty? || ARGV.first == 'spec' || ARGV.first == 'simplecov')
  begin    
    ENV['APP_ENV'] = 'test'
    ENV['CODECLIMATE_REPO_TOKEN'] = 'eae8b682ab562169f9e44d714d701d9a73566e95450f96c05008cf37a4e19a46'
    require "codeclimate-test-reporter"
    require "simplecov"
    module SimpleCov::Configuration
      def clean_filters
        @filters = []
      end
    end
    SimpleCov.configure do
      clean_filters
      load_adapter 'test_frameworks'
    end
    SimpleCov.start
#     require 'coveralls'
#     Coveralls.wear!
  rescue LoadError, StandardError => e
    #no op to support Ruby 1.8.7, ree and Rubinius which do not support Coveralls
    puts 'Error loading Coveralls, SimpleCov, or CodeClimate'
    puts e.message
    puts e.backtrace.join("\n")
  end
end

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
  gem.summary = %Q{Easier type checking via auto-generated certain_type? methods}
  gem.description = %Q{Although polymorphism is a recommended standard in Object-Oriented programming for invoking varied behavior in an inheritance hierarchy, sometimes it is still useful to verify if a particular model belongs to a certain type when the behavior concerned does not belong to the model and is too small to require a Design Pattern like Strategy. To avoid the model.is_a?(CertainType) syntax, a more readable approach that developers resort to is to add an English-like method that hides the details of type checking model.certain_type?. Implementing such methods manually gets repetitive after a while, so an easier way to get these methods automatically is to mixin the EasilyTypable module.}
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
