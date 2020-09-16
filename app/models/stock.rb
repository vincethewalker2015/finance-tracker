class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1') # This is used in the free version
      #endpoint: 'https://cloud.iexapis.com/v1' -- This is the paid version
    
    client.price(ticker_symbol)  #This is returned
    
  end

end
