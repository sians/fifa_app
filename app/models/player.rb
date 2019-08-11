class Player < ActiveRecord::Base
  has_many :player_list_players
  has_many :player_lists, through: :player_list_players

  validates :first_name, presence: true
end
