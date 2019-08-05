require_relative 'player.rb'
require_relative 'player_scrapper.rb'
require_relative 'players_controller.rb'
require_relative 'router.rb'

base_url = "https://sofifa.com/players?keyword="

controller = Controller.new(base_url)
router = Router.new(controller)

router.run
