# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6] # right diagonal
]

## won? ##
def won?(board)
  # check each win combo
  WIN_COMBINATIONS.each do |win_combo|
    # if win_combo indices are all "X" or all "O", return win_combo
    if win_combo.all? {|index| board[index] == "X"} then
      return win_combo
    elsif win_combo.all? { |index| board[index] == "O" } then
      return win_combo
    end
  end
  # no win, return false
  return false
end

## full? ##
def full?(board)
  # return true if none of the indices are empty
  return board.none? {|index| index == " "}
end

## draw? ##
def draw?(board)
  # return true if board if full & not won
  return full?(board) && !won?(board)
end

## over? ##
def over?(board)
  return full?(board) || won?(board) || draw?(board)
end 

## winner ##
def winner(board)
  win_combo = won?(board)
  if win_combo == false then
    return nil
  elsif win_combo.all? {|index| board[index] == "X"} then
    return "X"
  elsif win_combo.all? {|index| board[index] == "O"} then
    return "O"
  end
end