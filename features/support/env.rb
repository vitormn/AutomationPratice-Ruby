# configuracao de ambientes
require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'selenium-webdriver'

# carregar modulos no ambiente
require_relative './components/button'
require_relative './components/headers'
require_relative './components/helpers'
require_relative './components/links'

# disponibilizar o modulo para ser usado sem precisar instanciar
World(Button)
World(Headers)
World(Helpers)
World(Links)

# variaveis de ambiente
@browser = ENV['BROWSER']

# configuracao de browsers
case @browser
when 'firefox'
  @driver = :selenium
when 'chrome'
  @driver = :selenium_chrome
when 'chrome_headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument '--headless'
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
else
  raise 'Invalid browser'
end

# configuracao do capybara
Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = 'http://automationpractice.com'
  config.default_max_wait_time = 10
end
