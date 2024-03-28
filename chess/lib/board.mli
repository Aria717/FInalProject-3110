(** defining the board structure*)
type piece 
type color 
type square 
type board

(**building the initial board displayed at the beginning of the game*)
val initial_board : square array array 

(**associating each piece with a corresponding letter so it is easy to distinguish it when the board is printed*)
val piece_to_string : piece -> string 

(** associating each color of the piece to a letter*)
val color_to_string : color -> string 


(** each box in the board is either empty or occupied*)
val square_to_string : square -> string 

(** displaying the board*)
val print_board : square array array -> unit 

(** parsing user input to move the pieces *)
val parse_input : string -> string * string

(** moving piece on the board from start_pos to end_pos*)
val move_piece : square array array -> string -> string -> unit 

(** making a move on the board*)
val make_move : square array array -> string -> unit 