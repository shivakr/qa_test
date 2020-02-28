PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))

$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')
$LOAD_PATH << File.join(PROJECT_ROOT, 'test_data')



Bundler.require

require_relative 'app_config'
require 'capybara/dsl'
require 'faker'
require 'pry'
require 'cucumber/core/ast/data_table'
require 'json'
require 'rspec'
require 'chronic'

require_all 'lib'
require_all 'utils'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = ENV['BROWSER'].to_sym
  config.default_max_wait_time = 30
  config.app_host = "#{AppConfig.app.base_url}"
end

World(Capybara::DSL)

