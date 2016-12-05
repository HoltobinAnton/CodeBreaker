require_relative 'game'

while(true)
  flag_game = true
  game = Game.new
  game.start
  game.start_mess
  while(flag_game)
    game.submit
    game.print_marking
    flag_game = game.inspection_game
  end
 exit unless(game.restart_game_mess?)
end

