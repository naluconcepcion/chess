open Board
open Command

(** This compilation unit contains all functions needed to test the
    validity of a chess move and check the current state (in check?,
    etc.) *)

(** A valid move of the piece at the first square to the second square. *)
type move = square * square

(** This type represents whether or not a player is in [Check]. If they
    are, it carries additional information about the direction in which
    the check is from. [NotCheck] otherwise. *)
type check_state =
  | Check of direction list
  | NotCheck

(** [get_checks b] is the check state of the given boardmstate [b]. The
    color to play is either in check [Check dir] from directions in
    [dir] or [NotCheck] *)
val get_checks : Board.t -> check_state

(* TODO: consider getting rid of the check_state input (just make it
   NotCheck)*)

(** [valid_piece_moves b p] is the list of all valid moves for piece [p]
    give the current board state [b]. *)
val valid_piece_moves : Board.t -> Board.p -> move list

(** [valid_moves color board] is the list of all valid moves in the
    current board state [board] for player [color]. *)
val valid_moves : Board.t -> move list

(** [is_valid_move move board] is true iff the move [move] is valid for
    the given board state [board]. *)
val is_valid_move : move -> Board.t -> bool

(** [is_checkmate board] is true iff the player to move in [board] is in
    check and cannot move any pieces. *)
val is_checkmate : Board.t -> bool

(** [is_stalemate board] is true iff the player to move in [board] is
    not in check and cannot move any pieces. *)
val is_stalemate : Board.t -> bool
