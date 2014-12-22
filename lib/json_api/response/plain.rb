module JsonApi
  class Response::Plain
    attr_reader :result, :error, :id, :data
    private :result, :error, :id

    def initialize(net_http_response)
      parsed_body = JSON.parse net_http_response.body
      @data = OpenStruct.new(parsed_body).to_h
      log_data
      @result = data[:result]
    end

    def successful?
      result.present?
    end

  private

    def log_data
      log data if JsonApi.log
    end

    def log(data)
      p data
    end
  end
end

