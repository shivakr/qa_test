# BrowserConfig.launch_browser
require 'httparty'

Before do
  # system("ng serve & watch -n")
  # response = HTTParty.get('http://localhost:4200')
  # response.code == 200
  # loop do
  #   response = HTTParty.get('http://localhost:4200')
  #   puts response.code
  #   if response.code == 200
  #     break
  #   end
  # end
  BrowserConfig.launch_browser
  visit("#{AppConfig.app.base_url}")
end

After do |scenario|
  embed("data:image/png;base64,#{Capybara.current_session.driver.browser.screenshot_as(:base64)}", 'image/png') if scenario.failed?
  Capybara.current_session.driver.quit
end
