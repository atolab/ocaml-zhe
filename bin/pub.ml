open Ocamlzhe
open Ctypes
open Foreign

let port =  7447

let () =
  let z = zhe(port) in
  let p = zhe_publish 1 0 1 in
  let rec loop n =
    match n with
    | i when i > 0 ->
      let t = zhe_platform_time () in
      ignore (zhe_write p "hello" 5 t ) ;
      zhe_flush ();
      zhe_once z 1000000000 ;
      loop (n - 1)
    | _ -> ()
  in
    loop 100

(* let pub = zhe_publish(1, 0, 1) in *)
