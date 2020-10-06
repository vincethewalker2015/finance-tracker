class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User' # Specifies that the class 'friend' is actually taken from 'User'
end
