require 'matrix'

puts "This is a game of 4 in a row!"

#Setting the board
def initialize
  @board=Array.new(6){Array.new(5)}
end

def populate_new_board
  (0..5).each do |row|
    (0..6).each do |cell|
      @board[row][cell]="-"
    end
  end
  @board
end

def display_board
  5.step(0, -1) do |row|
  #(0..5).each do |row|

    (0..6).each do |cell|
      print @board[row][cell]
      print " "
    end
    puts ""
  end
  puts ""
  puts "0 1 2 3 4 5 6"
end

def check_play(player, y, x)
  # #horizontal
  arr = []
  arr.push(check_horizontal(player))
  arr.push(check_vertical(player))
  arr.push(check_pos_diagonal(player, y, x))
  arr.push(check_neg_diagonal(player, y, x))
  if arr.include? true
    return true
  else
    return false
  end
end

def check_horizontal(player)
  counter = 0
  (0..5).each do |row|
    (0..6).each do |cell|
      if @board[row][cell]==player
        counter +=  1
        if counter == 4
          return true
        end
      else
        counter = 0
      end
    end
  end
  return false
end

def check_vertical(player)
  counter = 0
  (0..6).each do |cell|
    (0..5).each do |row|
      if @board[row][cell]==player
        counter +=  1
        if counter == 4
          return true
        end
      else
        counter = 0
      end
    end
  end
  return false
end

def check_pos_diagonal(player, y , x)
  puts "pos diag  "
  begin
    if @board[(y+1)][(x-1)] == player && @board[(y+2)][(x-2)] == player && @board[(y+3)][(x-3)] == player
      puts "correct place"
      return true
    end
  rescue
    begin
      puts "error occured"
      if  @board[y+1][x-1] == player && @board[y-1][x+1] == player && @board[y+2][x-2] == player
        return true
      elsif @board[y-1][x+1] == player && @board[y-2][x+2] == player && @board[y+1][x-1] == player
        return true
      elsif @board[y-1][x+1] == player && @board[y-2][x+2] == player && @board[y-3][x+3] == player
        return true
      else
        return false
      end
    rescue
      return false
    end
  end
end

def check_neg_diagonal(player, y , x)
  puts "at neg_diagonal"
  begin
    if @board[(y+3)][(x+3)] == player && @board[(y+1)][(x+1)] == player && @board[(y+2)][(x+2)] == player
      puts "found 1"
      return true
    end
  rescue
    begin
      if  @board[y-1][x-1] == player && @board[y+1][x+1] == player && @board[y+2][x+2] == player
        puts "found 2"

        return true
      elsif @board[y-1][x-1] == player && @board[y+1][x+1] == player && @board[y-2][x-2] == player
        puts "found 3"

        return true
      elsif @board[y-1][x-1] == player && @board[y-2][x-2] == player && @board[y-3][x-3] == player
        puts "found 4"

        return true
      else
        return false
      end
    rescue
      return false
    end
  end
end


#Setup game
initialize
@board = populate_new_board
gameFin = true
playerOne = true
display_board
while gameFin

  if playerOne
    incorrectInput = true

    while incorrectInput
      puts "Circles turn"
      print "Enter row:  "
      input = (gets.strip).to_i
      if input > 6
        puts "Not a valid row please enter again"
        next
      end
      if @board[5][input] == "-"
        4.step(0, -1) do |i|
          if @board[i][input] != "-"
            i += 1

            @board[i][input] = "O"
            display_board
            if check_play("O", i, input)
              puts "circle wins!"
              exit
            end
            break
          end
          if i == 0
            @board[0][input] = "O"
            display_board
            if check_play("O", i, input)
              puts "circle wins!"
              exit
            end
          end
        end

        incorrectInput = false
      else
        puts "That row is full please try again"
      end
    end

    playerOne = false





  else
    incorrectInput = true

    while incorrectInput
      puts "Crosses turn"
      print "Enter row:  "
      input = (gets.strip).to_i
      if input > 6
        puts "Not a valid row please enter again"
        next
      end
      if @board[5][input] == "-"
        4.step(0, -1) do |i|
          if @board[i][input] != "-"
            i += 1
            @board[i][input] = "X"
            display_board
            if check_play("X", i, input)
              puts "crosses wins!"
              exit
            end
            break
          end
          if i == 0
            @board[0][input] = "X"
            display_board
            if check_play("X", i, input)
              puts "circle wins!"
              exit
            end
          end
        end

        incorrectInput = false
      else
        puts "That row is full please try again"
      end
    end
    playerOne =true
  end

end
