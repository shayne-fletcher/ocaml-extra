val strip_infix_s : string -> string -> (string * string) option
val strip_suffix_s : string -> string -> string option
val strip_prefix_s : string -> string -> string option

val replace_s : string -> string -> string -> string

(* [repeatedly_s f str] applies [f] as many times as necessary to
   reduce [str] to a list of things *)
val repeatedly_s : (string -> ('b * string)) -> string -> 'b list

(* [isspace c] tests if [c] is a space char. *)
val isspace : char -> bool

(* [trim_start s] strip leading space from s. *)
val trim_start: string -> string

(* [word1 s] to split the first word of a string *)
val word1: string -> (string * string)
