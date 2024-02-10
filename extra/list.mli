val implode : char list -> string
val explode : string -> char list

val bimap : ('a -> 'b) -> ('c -> 'd) -> 'a * 'c -> 'b * 'd
val first : ('a -> 'b) -> 'a * 'c -> 'b * 'c
val second : ('c -> 'd) -> 'a * 'c -> 'a * 'd

val strip_prefix : 'a list -> 'a list -> 'a list option
val strip_suffix : 'a list -> 'a list -> 'a list option
val strip_infix : 'a list -> 'a list -> ('a list * 'a list) option
