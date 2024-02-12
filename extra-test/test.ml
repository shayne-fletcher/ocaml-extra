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

let tests = "test suite for extra" >::: [
      "strip_prefix_s_0" >:: test_strip_prefix_s_0;
      "replace_s_0" >:: test_replace_s_0;
      "replace_s_1" >:: test_replace_s_1;
      "replace_s_2" >:: test_replace_s_2;
      "replace_s_3" >:: test_replace_s_3;
]

let _ = run_test_tt_main tests
