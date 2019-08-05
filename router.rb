class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "FIFA 19!"
    puts "                    "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.create
    when 2 then stop
    else
      puts "Please press 1, 2"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "To look up a player press 1"
  end
end
