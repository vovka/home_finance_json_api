module JsonApi
  autoload :Request, 'json_api/request'
  autoload :Response, 'json_api/response'

  cattr_accessor :email, :password, :ssl, :log, :test

  CONFIG = YAML.load_file "#{__dir__}/../config.yml"

  self.email = CONFIG['email']
  self.password = CONFIG['password']
  self.ssl = CONFIG['ssl']
  self.log = CONFIG['log']
  self.test = OpenStruct.new CONFIG['test']
  
  ENDPOINT = "http#{'s' if ssl}://home.finance.ua/services/index.php"
end

