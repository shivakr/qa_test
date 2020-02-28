class BrowserConfig < Settingslogic

  source File.join(PROJECT_ROOT, 'browsers.yml')
  namespace AppConfig.current_environment

  def launch_browser
    caps = current_browser.capabilities
    if caps[:browser] == "chrome"
      desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
    elsif caps[:browser] == "firefox"
      desired_capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
    end

    Capybara.register_driver(AppConfig.current_browser.to_sym) do |app|
      # if AppConfig.current_environment == 'ci'
      #
      #   driver = Capybara::Selenium::Driver.new(app,
      #                                           browser: :remote,
      #                                           url: AppConfig.selenium_hub_url,
      #                                           desired_capabilities: desired_capabilities)
      #   driver
      if AppConfig.current_environment == 'dev'
        driver = Capybara::Selenium::Driver.new(app,
                                                browser: current_browser.name,
                                                desired_capabilities: desired_capabilities)
        driver
      else
        raise 'UNSUPPORTED ENVIRONMENT'
      end
    end
  end

  private

  # current browser object
  def current_browser
    self.send(AppConfig.current_browser)
  end

end
