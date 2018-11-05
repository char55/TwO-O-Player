class Player
  attr_reader :lives, :id

  def initialize(id)
    @lives = 3
    @id = id
  end

  def wrongAnswer
    puts "Player #{id}: Serioulsy?  No."
    @lives -= 1
    if @lives == 0
      gameOver
    end
  end

  def rightAnswer
    puts "Player #{id}: YES! You are correct."
  end

  def gameOver
    puts "Game Over :/\nYou lose."
  end

  def isAlive?
    @lives != 0
  end
end
