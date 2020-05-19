class TicTacToe

attr_accessor :board
WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #diagonal starting from zero
    [2,4,6] #diagonal starting from 2
]
def initialize(board = nil)
    @board = Array.new(9, " ")
end


def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(string)
    user_input = string.to_i
    @board[user_input-1] = user_input - 1
end


def move(index, token = "X")
    @board[index] = token
end


def position_taken?(token)
    #binding.pry
    if @board[token] == "X" || @board[token] == "O"
        return true
    else
       return false
    end
end


def valid_move?(token)
    # binding.pry
 if (0..8).include?(token) && position_taken?(token) == false
   true
else
    nil
end
end


def turn_count
   # binding.pry
   moves = @board.count("X") + @board.count("O")
end
def current_player
    if turn_count % 2 == 0
        "X"
    else
        "O"
    end
 end


def turn
    #binding.pry
    #ask for input
    puts "Pick a number 1-9"
    #get input
    input = gets.chomp
    #translate input into index 
    position = input_to_index(input)
    if valid_move?(position)
       move(position, current_player)
    else
        #will restart turn
        turn
    end
display_board
end


def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end


  def draw?
    !won? && full?
  end

  
  def over?
    won? || draw?
  end


  # #full? checks to see if the board is full, ie no empty spaces remain
  def full?
    !@board.any?{|x| x == "" || x == " "}
  end


  # #winner checks to see what kind of token is in the winning combination, if one exists
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

 def play 
   
 end 
 
 


end