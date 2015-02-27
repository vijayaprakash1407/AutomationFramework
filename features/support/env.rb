require 'rspec'
require 'watir-webdriver'
require 'yaml'
require_relative '../test_data/pagesURL'

########## LOAD/SETUP CONFIGS #########
ENV['TEST_ENV'] ||= 'default'.downcase
USERS = YAML.load_file("features/test_data/users.yml")
$BROWSER = YAML.load_file("features/support/config/browsers.yml")
$BASE_URL = YAML.load_file("features/support/config/environments.yml")[ENV['TEST_ENV']][:url]

######### BROWSER INITIALIZER #########
browser = Watir::Browser.new ENV['BROWSER'] ||= 'default'.downcase
browser.window.move_to(0, 0)
browser.window.resize_to(1280, 800)

########### SET-UP ##############
Before do
  @browser = browser
end

########## TEAR-DOWN ###########
at_exit do
  browser.close
end