val strip_infix_s : string -> string -> (string * string) option
val strip_suffix_s : string -> string -> string option
val strip_prefix_s : string -> string -> string option

val replace_s : string -> string -> string -> string

val repeatedly_s : (string -> ('b * string)) -> string -> 'b list

(* [isspace c] tests if [c] is a space char. *)
val isspace : char -> bool

(* [trim_space s] strip leading space from s. *)
val trim_space: string -> string
