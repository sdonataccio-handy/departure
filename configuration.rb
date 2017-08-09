require 'yaml'

class Configuration
  CONFIG_PATH = 'config.yml'

  attr_reader :config

  def initialize
    @config = YAML.load_file(CONFIG_PATH)
    set_config_from_env('username', 'DATABASE_USER')
    set_config_from_env('password', 'DATABASE_PASS')
    set_config_from_env('database', 'DATABASE_NAME')
  end

  def [](key)
    config[key]
  end

  private

  def set_config_from_env(config_var, env_var)
    @config[config_var] = ENV[env_var] if ENV[env_var]
  end
end
