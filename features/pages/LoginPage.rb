require_relative '../support/env'

class LoginPage
  include WatirHelper

  def initialize(browser)
    @browser = browser
  end

  def go_to_login_page
      visit_page($BASE_URL+$Login_URL)
  end

  def click_on_sign_in
    @browser.button(:id, 'submit').click
  end

  def input_username
    @browser.text_field(:id, 'UserName')
  end

  def input_password
    @browser.text_field(:id, 'Password')
  end

  def text_equals
    @browser.text.should
  end

end