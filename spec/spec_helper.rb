ENV['RACK_ENV'] = 'test'
require 'capybara/rspec'
require './app/models/link'
require './app/models/tag'
require './app/app'
require 'database_cleaner'
require './app/data_mapper_setup'

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
end


require File.join(File.dirname(__FILE__), '..', './app/app.rb')
Capybara.app = BookmarkManager
