module JsonApi
  class Request::Data
    def self.login(email: JsonApi.email, password: JsonApi.password)
      {
        id: 1,
        service: 'sauth',
        method: 'auth',
        params: [
          {
            email: email,
            password: password
          }
        ]
      }
    end

    def self.outcome(previous_response,
                     date:,
                     comment:,
                     amount:,
                     currency_id:,
                     category_id:,
                     account_id:)
      {
        service: "soperations",
        method: "write",
        id: previous_response.request_id + 1,
        params: [
          {
            token: previous_response.token,
            idUser: previous_response.user_id.to_s,
            idAccount: previous_response.account_id.to_s
          },
          [
            {
              operationActionType: '0',
              operationObject:
              {
                id: '-1',
                type: '0',
                date: date.to_s,
                comment: comment,
                sum: amount.to_s,
                idCurrency: currency_id.to_s,
                idCtg: category_id.to_s,
                idSchet: account_id.to_s
              }
            }
          ]
        ]
      }
    end
  end
end

