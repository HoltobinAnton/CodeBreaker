require './spec_helper'

describe DataCheck do
  subject {Object.new.extend(DataCheck)}
  before(:each) do
    @game = Game.new
    @game.start
  end

  context '.data_checking?(data)' do
    it 'for error checking, should return false' do
      expect(subject.data_checking?('1234')).to be(false)
      expect(subject.data_checking?('4444')).to be(false)
      expect(subject.data_checking?('1212')).to be(false)
      expect(subject.data_checking?('6111')).to be(false)
    end

    it 'for error checking, should return true' do
      expect(subject.data_checking?('4440')).to  be(true)
      expect(subject.data_checking?('12121')).to be(true)
      expect(subject.data_checking?('6171')).to  be(true)
      expect(subject.data_checking?('')).to      be(true)
      expect(subject.data_checking?('test')).to  be(true)
      expect(subject.data_checking?('any_string')).to be(true)
    end
  end

  context '.check_victory?' do
    it 'should be true' do
      @game.user_code = @game.secret_code.clone
      expect(subject.check_victory?).to be(true)
    end

    it 'should be false' do
      @game.user_code = @game.secret_code.clone.reverse
      expect(@game.check_victory?).to be(false)
    end
  end

  context '.check_attempts_ended?' do
    it 'if no more attempts left'do
      @game.choice_did, @game.choice_size  = 10, 10
      expect(@game.check_attempts_ended?).to be(true)
    end

    it 'if choice_did < choice_size should return false' do
      @game.choice_did, @game.choice_size  = 9, 10
      expect(@game.check_attempts_ended?).to be(false)
    end
  end

  context '.check_for_match'
  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '1234'
    @game.check_for_match
    expect(@game.result).to eq('++++')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1111', '1111'
    @game.check_for_match
    expect(@game.result).to eq('++++')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '1235'
    @game.check_for_match
    expect(@game.result).to eq('+++')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '6123', '6523'
    @game.check_for_match
    expect(@game.result).to eq('+++')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '5555'
    @game.check_for_match
    expect(@game.result).to eq('')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '4321'
    @game.check_for_match
    expect(@game.result).to eq('----')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '2134'
    @game.check_for_match
    expect(@game.result).to eq('++--')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1266', '1652'
    @game.check_for_match
    expect(@game.result).to eq('+---')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1266', '5512'
    @game.check_for_match
    expect(@game.result).to eq('--')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '5551'
    @game.check_for_match
    expect(@game.result).to eq('-')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '1536'
    @game.check_for_match
    expect(@game.result).to eq('++')
  end

  it 'responds by marking' do
    @game.secret_code, @game.user_code, = '1234', '5255'
    @game.check_for_match
    expect(@game.result).to eq('+')
  end

end
