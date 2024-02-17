let insertion_sort xs =
  let rec insert a xs = match xs with
    | [] -> [a]
    | x :: xs when a <= x -> a :: x :: xs
    | x :: xs -> x :: insert a xs
  in
  Stdlib.List.fold_left (fun acc c -> insert c acc) [] xs
let take n xs =
  let rec take acc n xs =
    if n <= 0 then acc
    else
      match xs with
      | [] -> Stdlib.List.rev acc
      | x :: xs -> take (x ::acc) (n - 1) xs
  in
  take [] n xs

let rec drop n xs =
  if n <= 0 then
    xs
  else
    match xs with
    | [] -> []
    | _ :: xs -> drop (n - 1) xs

let split n xs  = (take n xs, drop n xs)

let rec merge xs ys =
  match (xs, ys) with
  | ([], ys) -> ys
  | (xs, []) -> xs
  | (x :: xs, y :: ys) ->
     if x <= y then
       x :: merge xs (y :: ys)
     else
       y :: merge (x :: xs) ys

let rec merge_sort = function
  | [] | [_] as xs -> xs
  | xs ->
     let l, r = split ((Stdlib.List.length xs) / 2) xs in
     merge (merge_sort l) (merge_sort r)


let rec quick_sort = function
  | [] | [_] as x -> x
  | h :: xs ->
     let ls, rs =
       Stdlib.List.fold_left
         (fun (ls, rs) x ->
           if x <= h then (x :: ls, rs) else (ls, x :: rs))
         ([], []) xs in
     quick_sort ls @ [h] @ quick_sort rs
