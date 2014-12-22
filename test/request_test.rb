require "#{__dir__}/test_helper"

module JsonApi
  class RequestTest < ActiveSupport::TestCase
    test "it makes login request with valid credentials and gets successful response" do
      request = Request.new data: Request::Data.login

      response = request.send

      assert_kind_of Response::Successful, response
    end

    test "it makes login request with invalid credentials and gets erroneous response" do
      request = Request.new data: Request::Data.login(email: 'not.registered@example.com', password: '111111')

      response = request.send

      assert_kind_of Response::Erroneous, response
    end

    test 'it writes data' do
      response = Request.new(data: Request::Data.login).send
      request = Request.new data: Request::Data.outcome(response,
                                                        date: Request::Date.today,
                                                        comment: 'It is a test record. ',
                                                        amount: 123.456,
                                                        currency_id: JsonApi.test.currency_id,
                                                        category_id: JsonApi.test.category_id,
                                                        account_id: JsonApi.test.account_id)

      response = request.send

      assert_kind_of Response::Successful, response
    end
  end
end

