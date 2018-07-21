Given(/^user has registered$/) do
  @username = ENV['USERNAME']
  @passwd = ENV['PASSWORD']

  p "Username: #{@username}"
  p "Password: #{@passwd}"
end

When(/^user is in home page$/) do
  @browser = LoginPage.new
  @browser.load
end

And(/^user clicks login button$/) do
  @browser.home_login_button.click
end

# And(/^user logins to Twiter$/) do
#   @loginpage = LoginPage.new
#   @loginpage.login(@username, @passwd)
# end
#
Then (/^user will see log in text "(.*?)"$/) do |expectedText|
  # page.should have_content(expectedText)
  expect(@browser.log_in_text_present).to eq(expectedText)
end
#
# Then (/^user will see account name "(.*?)"$/) do |expectedText|
#   @homepage = HomePage.new
#   expect(@homepage.name_present).to eq(expectedText)
# end
