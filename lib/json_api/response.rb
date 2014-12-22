module JsonApi
  class Response
    autoload :Builder, 'json_api/response/builder'
    autoload :Plain, 'json_api/response/plain'
    autoload :Successful, 'json_api/response/successful'
    autoload :Erroneous, 'json_api/response/erroneous'
  end
end

