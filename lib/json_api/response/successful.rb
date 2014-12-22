module JsonApi
  class Response::Successful
    attr_reader :token, :user_id, :account_id, :request_id

    def initialize(data)
      @token = data[:result]['token']
      @user_id = data[:result]['idUser']
      @account_id = data[:result]['idAccount']
      @request_id = data[:id]
    end
  end
end

