open OUnit2
open Sort

let sort f ls expect = assert_equal (f ls) expect

let tests =
  "test suite for sort" >::: [
      "insertion_sort_0" >:: (fun _ -> sort insertion_sort [] []);
      "insertion_sort_1" >:: (fun _ -> sort insertion_sort [1] [1]);
      "insertion_sort_2" >:: (fun _ -> sort insertion_sort [3; 2; 1] [1; 2; 3]);
      "insertion_sort_3" >:: (fun _ -> sort insertion_sort [3; 1; 2; 2] [1; 2; 2; 3]);
      "merge_sort_0" >:: (fun _ -> sort merge_sort [] []);
      "merge_sort_1" >:: (fun _ -> sort merge_sort [1] [1]);
      "merge_sort_2" >:: (fun _ -> sort merge_sort [3; 2; 1] [1; 2; 3]);
      "merge_sort_3" >:: (fun _ -> sort merge_sort [3; 1; 2; 2] [1; 2; 2; 3]);
      "quick_sort_0" >:: (fun _ -> sort quick_sort [] []);
      "quick_sort_1" >:: (fun _ -> sort quick_sort [1] [1]);
      "quick_sort_2" >:: (fun _ -> sort quick_sort [3; 2; 1] [1; 2; 3]);
      "quick_sort_3" >:: (fun _ -> sort quick_sort [3; 1; 2; 2] [1; 2; 2; 3]);
    ]

let _ = run_test_tt_main tests

(*
let implode (l: char list) : string =
  let n = Stdlib.List.length l in
  let s = Stdlib.Bytes.make n ' ' in
  List.iteri (fun i x -> Bytes.set s i x) l;
  Bytes.to_string s

let explode (s: string) : char list =
  Stdlib.List.rev (Stdlib.String.fold_left (fun acc c -> c :: acc) [] s)

let rec intercalate (a: 'a) : 'a list -> 'a list = function
  | [] | [_]  as xs -> xs
  | x :: xs -> x :: a :: intercalate a xs
 *)

(* let _ = Printf.printf "%s\n" (Stdlib.List.fold_left (fun acc s -> acc ^ s) "" (intercalate ", " ["Hello"; "world"])) *)
