open Ocamlzhe

let port =  7447
let period = 100000000

let () =
  let z = zhe port in
  let p = zhe_publish 1 0 1 in
  for i = 0 to period do
    let t = zhe_platform_time () in
    ignore (zhe_write p "hello" 5 t ) ;
    zhe_flush () ;
    zhe_once z period ;
  done
