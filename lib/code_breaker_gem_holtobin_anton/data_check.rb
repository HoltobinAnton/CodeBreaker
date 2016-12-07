module CodeBreakerGemHoltobinAnton
  module DataCheck
    def data_checking?(data)
      hint_mess(hint) if data.capitalize == 'Hint'
      exit if data.capitalize == 'Exit'
      data =~ /(^([1-6]{4})$)/? false : true
    end

    def check_victory?
      @secret_code.eql?(@user_code)
    end

    def check_attempts_ended?
      @choice_did == @choice_size ? true : false
    end

    def check_for_match(secr_temp = @secret_code.clone, user_temp = @user_code.clone)
      plus_count = 0
      secr_temp.each_char.with_index do |item, index|
        if item == user_temp[index - plus_count]
          secr_temp[index - plus_count], user_temp[index - plus_count], = '', ''
          plus_count += 1
        end
      end

      minus_count = (secr_temp.chars & user_temp.chars).size
      result_add_plus_minus(plus_count,minus_count)
    end

    def result_add_plus_minus(plus, minus)
      plus.times { @result << '+'}
      minus.times { @result << '-'}
    end
  end
end

