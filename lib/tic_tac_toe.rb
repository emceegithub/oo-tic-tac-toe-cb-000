class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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
  
  def move(index, players_token)
    @board[index] = players_token
  end
  
  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      return false
    else
      return true
    end
  end
  
  def valid_move?(position)
    if (position < 0 || position > 8) # if not on board
      return false
    elsif (@board[position] == "X" || @board[position] == "O") # if occupied
      return false
    else
      return true
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |element|
      if (element == "X" || element == "O")
        counter += 1
      else
        # do nothing
      end
    end
    return counter
  end
  
  def current_player
    if (turn_count.even? == true)
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return win_combination
      else
        # do nothing
      end
    end
    return nil
  end
  
  def full?
    counter = 0
    @board.each do |element|
      if (element == "X" || element == "O")
        counter += 1
      else
        # do nothing
      end
    end
    if counter == 9
      return true
    else
      return false
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
    if ( won? || draw? || full? )
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X")
          return "X"
        elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return "O"
        else
          # do nothing
        end
      end
    else
      return nil
    end
  end
  
  
  
  
  
  
end