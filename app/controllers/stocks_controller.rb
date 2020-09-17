class StocksController < ApplicationController

    def search
      @stock = Stock.new_lookup(params[:stock])
      #render json: @stock (shows view in JSON format)
      render 'users/my_portfolio'
    end

end