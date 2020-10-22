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
end
