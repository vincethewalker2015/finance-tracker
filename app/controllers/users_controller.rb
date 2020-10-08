class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  # def search 
  #   render json: params[:friend]
  # end

  def search
    if params[:friend].present?
      @friends = params[:friend].present? # This can create multiple results thus the choice to change from @friend to @friends
        @friends = User.search(params[:friend])
        @friends = current_user.except_current_user(@friends) # except_current_user from user model, This ensures that the Current User is not displayed as well + Need to pass in @friends sa an argument as it will not dispaly
        if @friends
          respond_to do |format|
            format.js { render partial: 'users/friend_result' }
          end
        else
          respond_to do |format|
            flash.now[:alert] = "User is not found.."
            format.js { render partial: 'users/friend_result' }
          end
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a friend name or email to search"
          format.js { render partial: 'users/friend_result' }
        end
      end
    end
end
