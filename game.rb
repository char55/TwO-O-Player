class GameMath

  def initialize
    p1 = Player.new(1)
    p2 = Player.new(2)
    @players = [p1, p2]
    @round = 0
  end

  def randomQA
    a = rand(20) + 1
    b = rand(20) + 1
    c = a + b
    [a, b, c]
  end

  def playerNow
    @players[@round % 2]
  end

  def run
    while(gameOver?)
      puts "----- NEW TURN -----"
      currentPlayer = playerNow
      arr = randomQA
      puts "Player #{currentPlayer.id}: What does #{arr[0]} plus #{arr[1]} equal?"
      answer = gets.chomp
      if answer.to_i == arr[2]
        currentPlayer.rightAnswer
      else
        currentPlayer.wrongAnswer
      end
      displayScore
      @round += 1
    end
  end

  def displayScore
    puts @players.map{|p| "P#{p.id} #{p.lives}/3"}.join(' VS ')
  end

  def gameOver?
    @players.select{|p| p.isAlive? }.count > 1
  end

end