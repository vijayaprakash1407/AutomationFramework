require 'rspec'
require 'watir-webdriver'
require_relative '../test_data/pagesURL'

########## DEFAULT TEST ENV ##########
### Default: TEST_ENV = QA   ####
ENV['TEST_ENV'] ||= 'default'.downcase

########## LOAD/SETUP CONFIGS #########
USERS = YAML.load_file("features/test_data/users.yml")
$BROWSER = YAML.load_file("features/support/config/browsers.yml")
$BASE_URL = YAML.load_file("features/support/config/environments.yml")[ENV['TEST_ENV']][:url]

######### BROWSER INITIALIZER #########
if ENV['firefox']
  browser = Watir::Browser.new :firefox, marionetter: true
else
  browser = Watir::Browser.new ENV['BROWSER'] ||= 'default'.downcase
end

########### SET-UP ##############
Before do
  browser.window.move_to(0, 0)
  browser.window.resize_to(1280, 800)
  @browser = browser
end

########## TEAR-DOWN ###########
at_exit do
  browser.close
end