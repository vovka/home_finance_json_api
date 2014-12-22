module JsonApi
  class Request::Date
    def self.today
      ::Date.today.to_time.to_i
    end
  end
end

