class PlayerList < ActiveRecord::Base
  belongs_to :user
  has_many :player_lists_players
  has_and_belongs_to_many :players, through: :player_lists_players
end
