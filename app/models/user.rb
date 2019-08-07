class User < ActiveRecord::Base
  has_many :player_lists

  validates :username, presence: true
  validates :username, uniqueness: true
end
