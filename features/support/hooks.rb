require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new ENV['BROWSER']
end

After do
  @browser.close
end
