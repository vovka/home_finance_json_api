module JsonApi
  class Response::Builder
    def self.build(response)
      if response.successful?
        Response::Successful 
      else
        Response::Erroneous
      end.new response.data
    end
  end
end

