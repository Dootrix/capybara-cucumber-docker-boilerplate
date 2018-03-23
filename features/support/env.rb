require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'selenium/webdriver'
require 'socket'
require 'fileutils'
require 'pry'

FileUtils.rm_rf('tmp')

Capybara.save_path = 'tmp/screenshots'
Capybara.ignore_hidden_elements = false
Capybara.default_max_wait_time = 20
Capybara.app_host = ENV['ROOT_URL']
Capybara.asset_host = ENV['ROOT_URL']

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w(headless no-sandbox disable-gpu window-size=1680,1050),
    }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
Capybara.javascript_driver = :headless_chrome


Capybara::Screenshot.prune_strategy = :keep_last_run

Capybara::Screenshot.register_driver :headless_chrome do |driver, path|
  driver.browser.save_screenshot path
end

Capybara::Screenshot.register_filename_prefix_formatter :cucumber do |scenario|
  "screenshot_#{Socket.gethostname}_#{scenario.name.downcase.gsub(/\s+/, '_')}"
end
