open Ocamlzhe

let port = 7447

let () =
  let z = zhe port in
  let on_data rid data len attch =
    let s = String.sub data 0 len  in
    print_endline s
  in let _ = zhe_subscribe 1 0 0 on_data Ctypes.null in
  while true do
    zhe_dispatch z ;
  done
