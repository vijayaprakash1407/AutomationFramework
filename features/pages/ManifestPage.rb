require_relative '../support/env'

class ManifestPage
  include WatirHelper

  def initialize(browser)
    @browser = browser
  end

  def go_to_manifest_page
    visit_page($BASE_URL+$MANIFEST_URL)
  end

  def search_text_box
    @browser.text_field(:name, 'search-box')
  end

  def click_search_button
    @browser.span(:class, 'add-on btn-inverse').click
  end
end
