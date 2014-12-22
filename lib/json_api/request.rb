require 'net/http'

module JsonApi
  class Request
    autoload :Data, 'json_api/request/data'
    autoload :Date, 'json_api/request/date'
    
    attr_reader :uri, :request, :response_builder
    private :uri, :request, :response_builder

    delegate :hostname, to: :uri
    delegate :port, to: :uri

    HEADER = {'Content-Type' =>'application/json'}

    def initialize(endpoint: ENDPOINT, data:, response_builder: Response::Builder)
      @uri = URI endpoint
      @request = Net::HTTP::Post.new uri, HEADER
      request.body = data.to_json
      @response_builder = response_builder
    end

    def send
      response_builder.build general_response
    end

  private
    
    def http
      Net::HTTP.new(hostname, port).tap { |http| http.use_ssl = use_ssl? }
    end

    def use_ssl?
      uri.scheme == 'https'
    end

    def general_response
      JsonApi::Response::Plain.new net_http_response
    end
      
    def net_http_response
      log_data
      http.start { |http| http.request @request }
    end

    def log_data
      log request.body
    end

    def log(data)
      p data
    end
  end
end

