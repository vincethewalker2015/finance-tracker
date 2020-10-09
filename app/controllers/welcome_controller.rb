class WelcomeController < ApplicationController
  
  def index
    @friendships = Friendship.all
  end
  
end
