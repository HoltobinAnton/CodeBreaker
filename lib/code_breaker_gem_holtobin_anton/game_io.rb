require 'yaml'
module CodeBreakerGemHoltobinAnton
  module GameIO
    def save_game(str)
      File.open('data/save_game.yaml','a') do |file|
        file.write(str)
      end
    end
  end
end