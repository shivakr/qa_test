class AppConfig < Settingslogic
  source File.join(PROJECT_ROOT,'app_config.yml')
  namespace ENV['ENV'] ||= 'ci'

  
  def current_environment
    ENV['ENV']
  end
  
  def current_browser
    ENV['BROWSER']
  end

end