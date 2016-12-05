module View
  def start_mess
    puts 'Hello, let is start playing'
    puts 'You can enter a "Hint" to display a random number'
    puts 'You can enter a "Exit" to exit the game'
  end

  def hint_mess(num)
    puts "Your tip is #{num}"
  end

  def end_game_mess(str)
    puts "You #{str}!"
    puts "Secret code = #{@secret_code}" if str == 'lost'
    print 'Enter your name : '
    name = gets.chomp.capitalize
    "#{name} choice did #{@choice_did} out of #{@choice_size}.Hint used = #{@hint_used} #{str} \n"
  end

  def restart_game_mess?
    print 'Do you want to start the game again? (Yes/No) '
    gets.chomp.capitalize == 'Yes'? true : false
  end

  def attempts_ended
    puts 'You have no more moves!'
  end

  def print_marking
    puts @result
  end
end