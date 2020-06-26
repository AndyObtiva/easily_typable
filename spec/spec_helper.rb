require 'simplecov'
require 'simplecov-lcov'
require 'coveralls' if ENV['TRAVIS']
require "codeclimate-test-reporter"

ENV['APP_ENV'] = 'test'
ENV['CODECLIMATE_REPO_TOKEN'] = 'eae8b682ab562169f9e44d714d701d9a73566e95450f96c05008cf37a4e19a46'

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
formatters = []
formatters << SimpleCov::Formatter::LcovFormatter
formatters << Coveralls::SimpleCov::Formatter if ENV['TRAVIS']
SimpleCov.formatters = formatters
SimpleCov.start do
  add_filter(/^\/spec\//)
end

require 'rubygems'
require 'bundler'
begin
  Bundler.require(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

RSpec.configure do |config|
end

require 'easily_typable'
