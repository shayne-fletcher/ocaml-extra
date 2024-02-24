open Core

type t = T of { id : int; aliases : Set.M(String).t }
[@@deriving sexp, equal, compare, hash]

let (t : t) =
  T
    {
      id = 42;
      aliases =
        List.fold_left ~f:Set.add
          ~init:(Set.empty (module String))
          [ "foo"; "bar" ];
    }

let _ = Core.Printf.printf "%s\n" (Sexp.to_string (sexp_of_t t))
