class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
  end

  def position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def move(board, pos, char)
    board[pos] = char
  end

  def turn_count(board)
    num_turns = 0

    board.each do |val|
      if val == 'X' || val == 'O'
        num_turns += 1
      end
    end

    num_turns
  end

  def current_player(board)
    if turn_count(board).even?
      return 'X'
    end

    'O'
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end

    false
  end

  def full?(board)
    board_full = board.all? do |index|
      index == 'O' || index == 'X'
    end

    board_full
  end

  def draw?(board)
    full = full?(board)
    won = won?(board)

    if full && !won
      return true
    elsif (!won && !full) || won
      return false
    end
  end
end
