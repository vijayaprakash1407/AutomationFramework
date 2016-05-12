require_relative '../support/env'

class HomePage
  include WatirHelper

  ###### Browser Initialization ######
  def initialize(browser)
    @browser = browser
  end

  ###### Goes to Homepage ######
  def go_to_home_page
    visit_page($BASE_URL)
  end

  ###### Search text-field module ######
  def search_text_box
    @browser.text_field(:name, 'search-box')
  end

  ###### Clicks on Search button ######
  def click_search_button
    @browser.span(:class, 'add-on btn-inverse').click
  end
end
