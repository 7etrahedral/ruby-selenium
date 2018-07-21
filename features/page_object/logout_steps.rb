Given(/^user is in home screen$/) do |expectedText|
  @homepage = HomePage.new
  @homepage.load
  @homepage.verifiy_home_screen
end

Given(/^user is in home screen and see "(.*?)"$/) do |expectedText|
  @homepage = HomePage.new
  @homepage.load
  expect(@homepage.name_present).to eq(expectedText)
  # page.should have_content(expectedText)
end

When(/^user clicks on account icon$/) do
  @homepage.click_account_icon
end

And(/^user clicks on logout button$/) do
  @homepage.click_logout
end

Then(/^user will be logged out$/) do
  @homepage.verify_logged_out
end

Then (/^user will be logged out and see "(.*?)"$/) do |expectedText|
  # page.should have_content(expectedText)
  @logoutpage = LogoutPage.new
  expect(@logoutpage.download_app_present).to eq(expectedText)
end
