Given /^I have gone to the DAD Home page$/ do
  @HomePage = HomePage.new(@browser)
  @HomePage.go_to_home_page
end

When /^I add "(.*)" to the search box$/ do |item|
  @HomePage.search_text_box.set(item)
end

And /^Click the Search Button$/ do
  @HomePage.click_search_button
end

And /^I "(.*)" for results to appear?$/ do |wait|
  sleep(wait.to_i)
end

Then /^The "(.*)" should be mentioned in the search/ do |result|
  @HomePage.content.should include result
end
