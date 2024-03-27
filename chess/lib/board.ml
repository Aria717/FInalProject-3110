(* board.ml *)
type piece = Pawn | Knight | Bishop | Rook | Queen | King

type color = White | Black

(* type square = {
  piece : piece option;
  color : color option;
} *)
type square = Empty | Occupied of piece * color

type board = square array array


let initial_board =
  [|
    [| Occupied (Rook, Black); Occupied (Knight, Black); Occupied (Bishop, Black); Occupied (Queen, Black); Occupied (King, Black); Occupied (Bishop, Black); Occupied (Knight, Black); Occupied (Rook, Black) |];
    [| Occupied (Pawn, Black); Occupied (Pawn, Black); Occupied (Pawn, Black); Occupied (Pawn, Black); Occupied (Pawn, Black); Occupied (Pawn, Black); Occupied (Pawn, Black); Occupied (Pawn, Black) |];
    [| Empty; Empty; Empty; Empty; Empty; Empty; Empty; Empty |];
    [| Empty; Empty; Empty; Empty; Empty; Empty; Empty; Empty |];
    [| Empty; Empty; Empty; Empty; Empty; Empty; Empty; Empty |];
    [| Empty; Empty; Empty; Empty; Empty; Empty; Empty; Empty |];
    [| Occupied (Pawn, White); Occupied (Pawn, White); Occupied (Pawn, White); Occupied (Pawn, White); Occupied (Pawn, White); Occupied (Pawn, White); Occupied (Pawn, White); Occupied (Pawn, White) |];
    [| Occupied (Rook, White); Occupied (Knight, White); Occupied (Bishop, White); Occupied (Queen, White); Occupied (King, White); Occupied (Bishop, White); Occupied (Knight, White); Occupied (Rook, White) |]
  |]


  let piece_to_string = function
  | Pawn -> "P"
  | Knight -> "N"
  | Bishop -> "B"
  | Rook -> "R"
  | Queen -> "Q"
  | King -> "K"

let color_to_string = function
  | White -> "W"
  | Black -> "B"

let square_to_string = function
  | Empty -> " "
  | Occupied (piece, color) -> (color_to_string color) ^ (piece_to_string piece)

let print_board board =
  Array.iter (fun row ->
    Array.iter (fun square ->
      print_string ("[" ^ (square_to_string square) ^ "]")
    ) row;
    print_newline ()
  ) board

