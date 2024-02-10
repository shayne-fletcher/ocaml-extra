open OUnit2

let test_strip_prefix_s_0 _ =
  match String.strip_prefix_s "foo" "foobar" with
  | Some "bar" -> assert true
  | _ -> assert false

let tests = "test suite for extra" >::: [
      "strip_prefix_s_0" >:: test_strip_prefix_s_0;
]

let _ = run_test_tt_main tests
