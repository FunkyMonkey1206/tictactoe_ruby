  class Game
    attr_accessor :player_one_points, :player_two_points, :current_player, :playing, :winner, :tl, :tc, :tr, :ml, :mc, :mr, :bl, :bc, :br
    
    def initialize()
      @player_one_points = 0
      @player_two_points = 0
      @current_player = "O"
      @playing = ""

      @winner = 0
      @tl = "1"
      @tc = "2"
      @tr = "3"
      @ml = "4"
      @mc = "5"
      @mr = "6"
      @bl = "7"
      @bc = "8"
      @br = "9"
      start_game()
    end

      def start_game()
          puts "The game has started"
          display_board()
          player_one_turn()
      end

      def display_board()
          puts " #{@tl} | #{@tc} | #{@tr} "
          puts "------------------"
          puts " #{@ml} | #{@mc} | #{@mr} "
          puts "------------------"
          puts " #{@bl} | #{@bc} | #{@br} "  
      end

      def update_board(pos)
        case pos
        when 1
          check_position(@tl)
          @tl = @current_player
        when 2
          check_position(@tc)
          @tc = @current_player
        when 3
          check_position(@tr)
          @tr = @current_player
        when 4
          check_position(@ml)
          @ml = @current_player
        when 5
          check_position(@mc)
          @mc = @current_player
        when 6
          check_position(@mr)
          @mr = @current_player
        when 7
          check_position(@bl)
          @bl = @current_player
        when 8
          check_position(@bc)
          @bc = @current_player
        when 9
          check_position(@br)
          @br = @current_player
        else
          repeat_turn()
        end
      end


      def player_one_turn()
        @playing = "Player 1"
        puts "It's #{playing}'s turn. Please select a position on the board"
        pos_input = gets.chomp
        update_board(pos_input.to_i)
        display_board()
        @current_player = "X"
        check_winner()
        if @winner != 1
          player_two_turn()
        end
      end 

      def player_two_turn()
        @playing = "Player 2"
        puts "It's #{playing}'s turn. Please select a position on the board"
        pos_input = gets.chomp
        update_board(pos_input.to_i)
        display_board()
        @current_player = "O"
        check_winner()
        if @winner != 1
          player_one_turn()
        end
      end

      def check_position(pos)
        if pos == "O" || pos == "X"
          repeat_turn()
        end
      end

      def repeat_turn()
        puts "Error please try again"
        if current_player == "O"
          player_one_turn()
        else
          player_two_turn()
        end
      end

      def check_winner()
          check_horizontal()
          check_vertical()
          check_diagonal()  
      end

      def check_horizontal()
        if @tl == @tc && @tl == @tr
          puts "Game is set! winner is #{playing}"
          end_game()
        elsif @ml == @mc && @ml == @mr
          puts "Game is set! winner is #{playing}"
          end_game()
        elsif @bl == @bc && @bl == @br
          puts "Game is set! winner is #{playing}"
          end_game()
        end
      end

      def check_vertical()
        if @tl == @ml && @tl == @bl
          puts "Game is set! winner is #{playing}"
          end_game()
        elsif @tc == @mc && @tc == @bc
          puts "Game is set! winner is #{playing}"
          end_game()
        elsif @tr == @mr && @tr == @br
          puts "Game is set! winner is #{playing}"
          end_game()
        end
      end

      def check_diagonal()
        if @tl == @mc && @tl == @br
          puts "Game is set! winner is #{playing}"
          end_game()
        elsif @tr == @mc && @tr == @bl
          puts "Game is set! winner is #{playing}"
          end_game()
        end
      end

      def end_game()
        @winner = 1
      end
  end

  new_game = Game.new