# frozen-string-literal: true
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'byebug'

# loading page object files
page_paths  = File.join(Dir.pwd, 'spec', 'pages', '**', '*.rb')
Dir.glob(page_paths).each { |file| require file }

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.default_driver = :firefox
Capybara.app_host = 'http://www.hi5.com/'
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.before(:each) do
    config.include Capybara::DSL
  end
end
