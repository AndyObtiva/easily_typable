ENV['APP_ENV'] = 'test'
ENV['CODECLIMATE_REPO_TOKEN'] = 'eae8b682ab562169f9e44d714d701d9a73566e95450f96c05008cf37a4e19a46'
require 'rubygems'
require 'bundler'
begin
  Bundler.require(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
if RUBY_VERSION >= '1.9' && !defined?(Rubinius)
  begin
    require "codeclimate-test-reporter"
    require "simplecov"
    require 'coveralls'
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      CodeClimate::TestReporter::Formatter,
      Coveralls::SimpleCov::Formatter
    ]
    SimpleCov.start
    Coveralls.wear!
  rescue LoadError, StandardError => e
    #no op to support Ruby 1.8.7, ree and Rubinius which do not support Coveralls
    puts 'Error loading Coveralls, SimpleCov, or CodeClimate'
    puts e.message
    puts e.backtrace.join("\n")
  end
end
