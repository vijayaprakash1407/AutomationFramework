Given /^I have gone to the DAD Login page$/ do
  @LoginPage = LoginPage.new(@browser)
  @LoginPage.go_to_login_page
end

When /^I add "(.*)" to the Username textbox$/ do |username|
  @LoginPage.input_username.set(username)
end

When (/^I enter "(.*?)" in the Username field$/) do |user|
  case user
    when 'Admin User'
      @LoginPage.input_username.set(USERS['ADMIN'])
      puts "User: #{USERS['ADMIN']}"
    when 'None-Admin User'
      @LoginPage.input_username.set(USERS['NONE_ADMIN_USER'])
      puts "User: #{USERS['NONE_ADMIN_USER']}"
    else
      puts "Not a valid Username"
  end
end

And /^I add "(.*)" to the Password textbox$/ do |password|
  @LoginPage.input_password.set(password)
end

And (/^I enter "(.*?)" in the Password field$/) do |user|
  case user
    when 'Admin Password'
      @LoginPage.input_password.set(USERS['ADMIN_PASSWORD'])
    #  puts "User: #{USERS['ADMIN1_PASSWORD']}"
    when 'None-Admin Password'
      @LoginPage.input_password.set(USERS['NONE_ADMIN_PASSWORD'])
    else
      puts "Not a valid Password"
  end
end

And /^click the Sign In Button$/ do
  @LoginPage.click_on_sign_in
end

And /^I wait for "(.*)" seconds?$/ do |wait|
  sleep(wait.to_i)
end

Then /^The "(.*)" should be displayed$/ do |result|
  @LoginPage.content.should include result
  #page.should have_css(page.qastuffs_main_css)
end
