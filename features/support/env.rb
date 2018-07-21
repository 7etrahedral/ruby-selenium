require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'rspec/retry'
require 'pry'
require 'securerandom'
require 'yaml'
require 'dotenv'
require 'site_prism'
require 'httparty'

Dotenv.load

#Selenium WebDriver Default Profile Configuration
Capybara.register_driver :selenium do |app|
  Capybara.default_driver = :selenium
  profile = Selenium::WebDriver::Firefox::Profile.new
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120
  Capybara::Selenium::Driver.new(app, http_client: client)
end

# #Selenium Webdriver Android Profile Configuration
# Capybara.register_driver :android do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#   profile['general.useragent.override'] = "android"
#   client = Selenium::WebDriver::Remote::Http::Default.new
#   client.timeout = 120
#   Capybara::Selenium::Driver.new(app, :profile => profile, http_client: client)
# end
#
# #Screenshot driver configuration for :android
# Capybara::Screenshot.register_driver(:android) do |driver, path|
#   driver.browser.save_screenshot path
# end

Before('@desktop') do
  Capybara.app_host = ENV['BASE_URL']
  Capybara.default_driver = :selenium
  Capybara.default_max_wait_time = 3
  Capybara::Screenshot.autosave_on_failure = true
  Capybara::Screenshot.webkit_options = { width:1366, height: 768}
  Capybara.save_path = "screenshots"
  page.driver.browser.manage.window.resize_to(1366, 768)
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.
  if (!@api)
    if scenario.failed?
      puts("ERROR REPORT")
      url = URI.parse(current_url)
      puts("URL = " + url.to_s)
    end

    if !scenario.outline?
      page.driver.browser.close
    end
  end
end
