val bimap : ('a -> 'b) -> ('c -> 'd) -> 'a * 'c -> 'b * 'd
val first : ('a -> 'b) -> 'a * 'c -> 'b * 'c
val second : ('c -> 'd) -> 'a * 'c -> 'a * 'd
