ENV['APP_ENV'] = 'test'
ENV['CODECLIMATE_REPO_TOKEN'] = '589a0a4a0884844eaa001173'
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
    require 'coveralls'
    Coveralls.wear!
  rescue LoadError, StandardError => e
    #no op to support Ruby 1.8.7, ree and Rubinius which do not support Coveralls
    puts 'Error loading Coveralls'
    puts e.message
    puts e.backtrace.join("\n")
  end
end
