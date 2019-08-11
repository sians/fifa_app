class PlayerListsPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :player_list
end
