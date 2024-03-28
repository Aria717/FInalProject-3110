(* main.ml *)
   open Chess.Board

(* Main game loop *)
(* let rec main_game_loop state =
  
  (* Display the board *)
  (* Prompt the current player for their move *)
  (* Validate the move *)
  (* Update the game state *)
  (* Check for game termination conditions *)
  (* If game is not over, continue the loop *)
  Otherwise, end the game *)

(* let initial_state =
  (* Initialize the board *)
  Initialize other fields of game state *)

(* Function to read user input *)
let read_input () =
  print_string "Enter your move (e.g., e2 e4): ";
  read_line ()

(* Function to execute moves until the user quits *)
let rec play_moves_until_quit board =
  print_board board;
  let input = read_input () in
  if input = "quit" then
    print_endline "Quitting..."
  else (
    make_move board input;
    play_moves_until_quit board
  )

(* Run the function *)
let () =
  let my_board = Array.copy initial_board in
  play_moves_until_quit my_board