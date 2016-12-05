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

  def check_for_match
    secr_temp, user_temp = @secret_code.clone, @user_code.clone
    secr_temp.each_char.with_index(index = 0) do |item, index|
      if item == user_temp[index]
        secr_temp[index],user_temp[index] = '0', '0'
        @result << '+'
      end
    end

    secr_temp.each_char do |item|
      next if item == '0'
      if user_temp.include?(item)
        @result << '-'
        secr_temp.gsub!(item,'0')
      end
    end
  end
end

