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
    ENV['APP_ENV'] = 'test'
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
  rescue LoadError, StandardError => e
    # no op to support older Rubies
    puts 'Not loading SimpleCov'
  end
end
require 'easily_typable'
