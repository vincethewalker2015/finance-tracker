class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol) #ticker_symbol is self created..
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1') # This is used in the free version
      #endpoint: 'https://cloud.iexapis.com/v1' -- This is the paid version
    
    #client.price(ticker_symbol)  #This is what is returned
    begin # begin and rescue are used to call to the API to see if a value exists if not we can alert that no value exists
    new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    # client.company / company_name / client.price are methods taken from the 'iex-ruby-client' gem document
    rescue => exception
      return nil
    end
    
  end

end
