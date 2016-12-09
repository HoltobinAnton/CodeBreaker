require_relative 'game'
module CodeBreakerGemHoltobinAnton
  while(true)
    game = Game.new
    game.start
    game.start_mess
    while(game.inspection_game?)
      game.submit
      game.print_marking
    end
   exit unless(game.restart_game_mess?)
  end
end

