class Player < ActiveRecord::Base
  has_many :player_lists_players
  has_and_belongs_to_many :player_lists, through: :player_lists_players

  validates :first_name, presence: true
end
