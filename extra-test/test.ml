open OUnit2

let test_strip_prefix_s_0 _ =
  match String.strip_prefix_s "foo" "foobar" with
  | Some "bar" -> assert true
  | _ -> assert false

let test_replace_s_0 _ =
  assert_equal (String.replace_s "el" "_" "Hello Bella") ("H_lo B_la")
let test_replace_s_1 _ =
  assert_equal (String.replace_s "el" "e" "Hello") ("Helo")
let test_replace_s_2 _ =
  assert_equal (String.replace_s "" "x" "Hello") ("xHxexlxlxox")
let test_replace_s_3 _ =
  assert_equal (String.replace_s "" "x" "") ("x")

let test_isspace_0 _ =
  assert(String.isspace ' ')

let test_take_while_0 _ =
  assert_equal [1; 2] (List.take_while (fun i -> i < 3) [1; 2; 3; 4])
let test_take_while_1 _ =
  assert_equal [] (List.take_while (fun i -> i < 3) [])
let test_take_while_2 _ =
  assert_equal [2; 4; 6] (List.take_while (fun i -> i mod 2  == 0) [2; 4; 6; 7; 8])

let test_drop_while_0 _ =
  assert_equal [3; 4] (List.drop_while (fun i -> i < 3) [1; 2; 3; 4])
let test_drop_while_1 _ =
  assert_equal [] (List.drop_while (fun i -> i < 3) [])
let test_drop_while_2 _ =
  assert_equal [7; 8] (List.drop_while (fun i -> i mod 2  == 0) [2; 4; 6; 7; 8])

let test_break_0 _ =
  assert_equal ([1; 2], [3; 4]) (List.break (fun i -> i >= 3) [1; 2; 3; 4])

let test_take_while_end_0 _ =
  assert_equal ([4; 6; 8]) (List.take_while_end (fun n -> n mod 2 == 0) [1; 2; 3; 4; 6; 8])
let test_drop_while_end_0 _ =
  assert_equal ([1; 2; 3]) (List.drop_while_end (fun n -> n mod 2 == 0) [1; 2; 3; 4; 6; 8])

let tests = "test suite for extra" >::: [
      "strip_prefix_s_0" >:: test_strip_prefix_s_0;

      "replace_s_0" >:: test_replace_s_0;
      "replace_s_1" >:: test_replace_s_1;
      "replace_s_2" >:: test_replace_s_2;
      "replace_s_3" >:: test_replace_s_3;

      "is_space_0" >:: test_isspace_0;

      "take_while_0" >:: test_take_while_0;
      "take_while_1" >:: test_take_while_1;
      "take_while_2" >:: test_take_while_2;

      "drop_while_0" >:: test_drop_while_0;
      "drop_while_1" >:: test_drop_while_1;
      "drop_while_2" >:: test_drop_while_2;

      "break_0" >:: test_break_0;

      "take_while_end_0" >:: test_take_while_end_0;

      "drop_while_end_0" >:: test_drop_while_end_0;
]

let _ = run_test_tt_main tests
