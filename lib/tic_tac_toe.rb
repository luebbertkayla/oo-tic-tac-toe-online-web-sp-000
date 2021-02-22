
class TicTacToe 
  
    WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i-1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == nil
      return false
    else
      return true 
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      return true 
    else
      return false 
    end
  end
  
  def turn_count
    counter = 0 
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    turn_count % 2 == 0? "X" : "O"
  end
  
  def turn 
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(index)
     move(index, current_player)
      display_board
   else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combination
      end

    end
   return false
  end
  
  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
    index = []
    index = won?
    if index == false
      return nil
    else 
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play 
    until over?
    turn
    end
   if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
  
end

#game = TicTacToe.new
#game.play





