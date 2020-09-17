class StocksController < ApplicationController

    def search
      if params[:stock]. present? # This will give an alert if No Ticker symbol is entered..
        @stock = Stock.new_lookup(params[:stock])
        if @stock # This will check to see (As in model if a stock value exists)
          #render json: @stock (shows view in JSON format)
          render 'users/my_portfolio'
        else
          flash[:alert] = "Please enter a valid symbol to search"
          redirect_to my_portfolio_path
        end
      else
        flash[:alert] = "Please enter a Symbol to search"
        redirect_to my_portfolio_path
      end

    end


end