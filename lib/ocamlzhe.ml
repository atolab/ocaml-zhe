open Ctypes
open PosixTypes
open Foreign

type zhe_t = unit ptr
let zhe_t : zhe_t typ = ptr void


let zhe_rid_t = int
let zhe_paysize_t = int
let zhe_time_t = int

type zhe_pubidx_t
let zhe_pubidx_t : zhe_pubidx_t structure typ = structure "zhe_pubidx_t"
let idx  = field zhe_pubidx_t "idx`" uint8_t
let () = seal zhe_pubidx_t

type zhe_subidx_t
let zhe_subidx_t : zhe_subidx_t structure typ = structure "zhe_subidx_t"
let idx  = field zhe_subidx_t "idx`" uint8_t
let () = seal zhe_subidx_t

let on_data_available_fun_t = zhe_rid_t @-> string @-> zhe_paysize_t @-> ptr void @->returning void

let zhe =
  foreign "zhe" (int @-> returning zhe_t)

let zhe_platform_time =
  foreign "zhe_platform_time" (void @-> returning int)

let zhe_publish =
  foreign "zhe_publish" (int @-> int @-> int @-> returning zhe_pubidx_t)

let zhe_subscribe =
  foreign "zhe_subscribe" (int @-> int @-> int @-> funptr on_data_available_fun_t @-> ptr void  @-> returning zhe_subidx_t)

let zhe_write =
  foreign "zhe_write" (zhe_pubidx_t @-> string @-> int @-> int @-> returning int)

let zhe_write_uri =
  foreign "zhe_write_uri" (string @-> string @-> int @-> int @-> returning int)

let zhe_dispatch =
  foreign "zhe_dispatch" (zhe_t @-> returning void)

let zhe_once =
  foreign "zhe_once" (zhe_t @-> int @-> returning void)

let zhe_loop =
  foreign "zhe_loop" (zhe_t @-> int @-> returning void)
  (* foreign "s_create_state_reader" (dds_entity_t @-> dds_entity_t @-> returning dds_entity_t) *)

let zhe_flush =
  foreign "zhe_flush" (void @-> returning void)
