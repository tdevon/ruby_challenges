class Player
  attr_accessor :name, :moves
  def initialize(args)
    @name = args[:name]
    @moves = args[:moves]
  end
  def store_move(move)
    moves.push(move)
  end
end

class Game
  attr_accessor :current_player, :game_status, :player1, :player2
  def initialize(args)
    @@game_board = [["_","_","_"],["_","_","_"],["_","_","_"]]
    @@winning_moves = [["1","4","9"],["1","2","3"], ["1","4","7"],["2","5","8"],["3","6","9"],["3","4","6"]]
    @player1 = args[:player1]
    @player2 = args[:player2]
    @current_player = args[:current_player]
    @game_status = args[:game_status]
  end

  def get_board
    current_board = self.player1.moves + self.player2.moves
    return current_board
  end
  def show_board
    self.player1.moves.each_with_index do |move_s,index|
      move = (move_s.to_i) -1
      if move <= 2
        @@game_board[0][move] = "X"
      elsif move >2 and move <=5
        @@game_board[1][move - 3] = "X"
      elsif move >5 and move <=9
        @@game_board[2][move - 6] = "X"
      end
    end
    self.player2.moves.each_with_index do |move_s,index|
      move = (move_s.to_i) -1
      if move <= 2
        @@game_board[0][move] = "O"
      elsif move >2 and move <=5
        @@game_board[1][move - 3] = "O"
      elsif move >5 and move <=9
        @@game_board[2][move - 6] = "O"
      end
    end
    
    print @@game_board[0].join(" | ")
    puts ""
    print @@game_board[1].join(" | ")
    puts ""
    print @@game_board[2].join(" | ")
    puts ""
    puts ""
  end

  def get_move
    valid_move = false
    until valid_move
      print("#{current_player.name} - Make a move: ")
      move = gets.chomp()
      if get_board.include? move
        puts("Taken.")
      else
        valid_move = false
        return move
      end
    end
  end

  def is_winner?
    if @@winning_moves.include? current_player.moves
      puts " "
      puts "=================="
      puts " "
      show_board
      puts " "
      puts "=================="
      puts " "
      return true
    else
      return false
    end
  end

  def switch_turns
    if self.current_player == player1
      self.current_player = player2
    elsif self.current_player == player2
      self.current_player = player1
    end
  end

end

player1 = Player.new({name: "player1", moves:[]})
player2 = Player.new({name: "player2",moves:[]})

game = Game.new({player1: player1, player2: player2, current_player: player1, game_status:true})

while game.game_status do
  game.show_board
  mv = game.get_move
  game.current_player.store_move(mv)
  if game.is_winner?
    puts "#{game.current_player.name} wins!"
    break
  else
    game.switch_turns
  end
end

