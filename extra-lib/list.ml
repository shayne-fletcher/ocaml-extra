let explode : string -> char list =
 fun s ->
  let n = Stdlib.String.length s in
  let rec loop acc i =
    if i = n then Stdlib.List.rev acc else loop (Stdlib.String.get s i :: acc) (i + 1)
  in
  loop [] 0

let implode : char list -> string =
 fun l ->
  let n = Stdlib.List.length l in
  let buf = Stdlib.Bytes.create n in
  let f i c = Stdlib.Bytes.set buf i c in
  Stdlib.List.iteri f l;
  Stdlib.Bytes.to_string buf

let bimap : ('a -> 'b) -> ('c -> 'd) -> 'a * 'c -> 'b * 'd =
 fun f g (x, y) -> (f x, g y)

let first : ('a -> 'b) -> 'a * 'c -> 'b * 'c = fun f -> bimap f Fun.id
let second : ('c -> 'd) -> 'a * 'c -> 'a * 'd = fun g -> bimap Fun.id g

let rec strip_prefix (pre : 'a list) (ys : 'a list) : 'a list option =
  match (pre, ys) with
  | [], ys -> Some ys
  | x :: xs, y :: ys when x == y -> strip_prefix xs ys
  | _, _ -> None

let strip_suffix (a : 'a list) (b : 'a list) : 'a list option =
  Option.map Stdlib.List.rev
    (strip_prefix (Stdlib.List.rev a) (Stdlib.List.rev b))

let rec strip_infix (needle : 'a list) (haystack : 'a list) :
    ('a list * 'a list) option =
  match (needle, haystack) with
  | needle, [] -> None
  | needle, x :: xs -> (
      match strip_prefix needle haystack with
      | Some rest -> Some ([], rest)
      | None -> Option.map (first (fun cs -> x :: cs)) (strip_infix needle xs))

(* [replace] a subsequence wherever it occurs.  *)
let rec replace (from: 'a list) (to_: 'a list) (xs : 'a list) : 'a list =
  let rec go =  function
    | [] -> to_
    | x :: xs -> to_ @ x :: go xs in
  match (from, to_, xs) with
  | ([], to_, xs) -> go xs
  | (from, to_, []) -> []
  | (from, to_, x :: xs) ->
     match strip_prefix from (x :: xs) with
         | Some xs -> to_ @ replace from to_ xs
         | None -> x :: replace from to_ xs

(*
Apply some operation repeatedly, producing an element of output
--   and the remainder of the list.--   and the remainder of the list.
--
-- When the empty list is reached it is returned, so the operation
-- is /never/ applied to the empty input.
-- That fact is encoded in the type system with 'repeatedlyNE'
--
-- > \xs -> repeatedly (splitAt 3) xs  == chunksOf 3 xs
-- > \xs -> repeatedly word1 (trim xs) == words xs
-- > \xs -> repeatedly line1 xs == lines xs
repeatedly :: ([a] -> (b, [a])) -> [a] -> [b]
repeatedly f [] = []
repeatedly f as = b : repeatedly f as'
    where (b, as') = f as
 *)

let rec repeatedly (f : 'a list -> ('b * 'a list)) (es: 'a list) : 'b list =
  match es with
  | [] -> []
  | _ -> let (b, es) = f es in b :: repeatedly f es

let rec drop_while (f : 'a -> bool) : 'a list -> 'a list =
  function
  | [] -> []
  | (x :: xs') as xs -> if f x then xs' else xs
