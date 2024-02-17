open List

let rec strip_prefix_s (pre : string) (ys : string) : string option =
  Option.map implode (strip_prefix (explode pre) (explode ys))

let strip_suffix_s (a : string) (b : string) : string option =
  Option.map implode (strip_suffix (explode a) (explode b))

(* e.g
   [strip_infix "::" "a::b::c" == Some ("a", "b::c")]
   [strip_infix "/" "foobar" == None]
*)
let strip_infix_s (needle : string) (haystack : string) :
    (string * string) option =
  Option.map
    (fun p -> bimap implode implode p)
    (strip_infix (explode needle) (explode haystack))

let replace_s from to_ xs =
  implode (List.replace (explode from) (explode to_) (explode xs))

let repeatedly_s f es =
  List.repeatedly (fun xs -> List.second explode (f (implode xs))) (explode es)

let isspace = function
  | (' ' | '\t' | '\n' | '\r') -> true
  | _ -> false

let trim_start s = implode (drop_while isspace (explode s))

let word1 str =
  List.second trim_start (
      List.bimap implode implode (
          List.break isspace (explode (trim_start str)))
    )
