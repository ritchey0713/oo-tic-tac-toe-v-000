class TicTacToe

def initialize (board = nil)
  @board = board || Array.new(9," ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  
  ]
  
    def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

 def turn_count
  counter = 0 
  @board.each do |index|
    if index == "X" || index == "O"
      counter+=1
    end
  end
  return counter
end

def current_player
   turn_count.even? ? "X" : "O"
 end
 
 def turn 
  puts "Please enter 1-9:"
   index = gets.strip
   input=input_to_index(index)
  if valid_move?(input)
     move(input, current_player)
     display_board
else
  puts "Please enter 1-9:"
   index = gets.strip
   input=input_to_index(index)
  end
 end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end

 def full?
    if @board.include?(" ")
      return false
    else
      true
    end  
  end 
  
    def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won? || full?
      return true
  end
end  

def winner
  if won? != nil
    @board[won?.detect {|index| @board[index] == "X" || @board[index] == "O"}]
  else
    nil
  end
end

def play
 until over?
  turn
end
 if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end

end






end