require_relative 'data_check.rb'
require_relative 'game_io.rb'
require_relative 'view.rb'

module CodeBreakerGemHoltobinAnton
  class Game
    attr_accessor :user_code, :choice_did, :hint_used, :choice_size, :secret_code, :result
    SECRET_CODE_SIZE = 4
    CHOICE_SIZE = 5
    include(DataCheck)
    include(GameIO)
    include(View)

    def initialize
      @choice_size = CHOICE_SIZE
      @secret_code, @user_code, @result = '', '', ''
      @hint_used, @choice_did = 0, 0
    end

    def start
      @secret_code = Array.new(SECRET_CODE_SIZE){1 + rand(6)}.join
    end

    def submit
      @result = ''
      begin
        print 'Please enter : '
      end while data_checking?(@user_code = gets.chomp)
      check_for_match
      @choice_did += 1
    end

    def inspection_game
      return end_game if(check_attempts_ended?)
      return end_game if(check_victory?)
      true
    end

    def end_game
      attempts_ended if(check_attempts_ended?)
      str = check_victory??end_game_mess('won') : end_game_mess('lost')
      save_game(str)
      false
    end

    def hint
      @hint_used += 1
      @secret_code.chars.sample
    end
  end
end