class WelcomeController < ApplicationController
  
  def index
    @friendships = Friendship.all
  end

  def about

  end
  
end
