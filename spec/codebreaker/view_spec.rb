require './spec_helper'

describe View do
  before(:each) do
    @game = Game.new
    @game.start
  end

  context '.restart_game?' do
    it 'Do you want to start again' do
      @game.stub(:gets).and_return('Yes')
      expect(@game.restart_game_mess?).to be(true)
    end

    it 'Do you want to start again' do
      @game.stub(:gets).and_return('yes')
      expect(@game.restart_game_mess?).to be(true)
    end

    it 'Do you want to start again' do
      @game.stub(:gets).and_return('No')
      expect(@game.restart_game_mess?).to be(false)
    end

    it 'Do you want to start again' do
      @game.stub(:gets).and_return('Anything')
      expect(@game.restart_game_mess?).to be(false)
    end
  end
end

