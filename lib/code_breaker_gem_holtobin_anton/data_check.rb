module CodeBreakerGemHoltobinAnton
  module DataCheck
    def data_checking?(data)
      hint_mess(hint) if data == 'Hint'
      exit if data == 'Exit'
      data =~ /(^([1-6]{4})$)/? false : true
    end

    def check_victory?
      @secret_code.eql?(@user_code)
    end

    def check_attempts_ended?
      @choice_did == @choice_size ? true : false
    end

    def check_for_match(secr_temp = @secret_code.clone, user_temp = @user_code.clone)
      secr_temp, user_temp = secr_temp.chars, user_temp.chars
      secr_temp.each_with_index do |item, index|
        if item == user_temp[index]
          secr_temp[index], user_temp[index] = nil
          @result << '+'
        end
      end
      [secr_temp,user_temp].each(&:compact!)
      secr_temp.each do |item|
        next unless  user_temp.include?(item)
          user_temp[user_temp.find_index(item)] = nil
          @result << '-'
      end
    end
  end
end

