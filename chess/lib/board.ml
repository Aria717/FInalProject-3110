type piece = Pawn | Knight | Bishop | Rook | Queen | King

type color = White | Black

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
  


  let parse_input input =
    match String.split_on_char ' ' input with
    | [start_pos; end_pos] -> (start_pos, end_pos)
    | _ -> failwith "Invalid input format. Please provide start and end positions separated by a space."
  

  let move_piece board start_pos end_pos =
    let start_col = int_of_char (Char.lowercase_ascii (String.get start_pos 0)) - int_of_char 'a' in
    let start_row = 8 - (int_of_char (String.get start_pos 1) - int_of_char '0') in
    let end_col = int_of_char (Char.lowercase_ascii (String.get end_pos 0)) - int_of_char 'a' in
    let end_row = 8 - (int_of_char (String.get end_pos 1) - int_of_char '0') in
    match board.(start_row).(start_col) with
    | Occupied (piece, color) ->
      board.(start_row).(start_col) <- Empty; (* Remove the piece from the start position *)
      board.(end_row).(end_col) <- Occupied (piece, color)  (* Place the piece at the end position *)
    | Empty -> invalid_arg "No piece at the starting position."
    
  
  let make_move board input =
    let start_pos, end_pos = parse_input input in
    move_piece board start_pos end_pos