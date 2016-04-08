(***********************************************************************)
(*                                                                     *)
(*                                OCaml                                *)
(*                                                                     *)
(*          Damien Doligez, projet Moscova, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 2002 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* We cannot use bignums because we don't do custom runtimes, but
   int64 is a bit short, so we roll our own 37-digit numbers...
*)

let n0 = Int64.of_int 0;;
let n1 = Int64.of_int 1;;
let n2 = Int64.of_int 2;;
let n3 = Int64.of_int 3;;
let n5 = Int64.of_int 5;;

let ( % ) = Int64.rem;;
let ( * ) = Int64.mul;;
let ( / ) = Int64.div;;
let ( + ) = Int64.add;;
let digit = Int64.of_string "1000000000000000000";;

let mul n (pl, ph) = ((n * pl) % digit, n * ph + (n * pl) / digit);;
let cmp (nl, nh) (pl, ph) =
  if nh < ph then -1
  else if nh > ph then 1
  else if nl < pl then -1
  else if nl > pl then 1
  else 0
;;

let x2 = fun p -> mul n2 p;;
let x3 = fun p -> mul n3 p;;
let x5 = fun p -> mul n5 p;;

let nn1 = (n1, n0);;
let buf = Buffer.create 5000
let pr (nl, nh) =
  if compare nh n0 = 0
  then Printf.bprintf buf "%Ld\n" nl
  else Printf.bprintf buf "%Ld%018Ld\n" nh nl
;;

(*
  (* bignum version *)
open Num;;
let nn1 = num_of_int 1;;
let x2 = fun p -> (num_of_int 2) */ p;;
let x3 = fun p -> (num_of_int 3) */ p;;
let x5 = fun p -> (num_of_int 5) */ p;;
let cmp n p = sign_num (n -/ p);;
let pr n = Printf.printf "%s\n" (string_of_num n);;
*)


(* This is where the interesting stuff begins. *)

open Lazy;;

type 'a lcons = Cons of 'a * 'a lcons Lazy.t;;
type 'a llist = 'a lcons Lazy.t;;

let rec map f l =
  lazy (
    match force l with
    | Cons (x, ll) -> Cons (f x, map f ll)
  )
;;

let rec merge cmp l1 l2 =
  lazy (
    match force l1, force l2 with
    | Cons (x1, ll1), Cons (x2, ll2)
       -> let c = cmp x1 x2 in
          if c = 0
          then Cons (x1, merge cmp ll1 ll2)
          else if c < 0
          then Cons (x1, merge cmp ll1 l2)
          else Cons (x2, merge cmp l1 ll2)
  )
;;

let rec iter_interval f l (start, stop) =
  if stop = 0 then ()
  else match force l with
       | Cons (x, ll)
          -> if start <= 0 then f x;
             iter_interval f ll (start-1, stop-1)
;;

let rec hamming = lazy (Cons (nn1, merge cmp ham2 (merge cmp ham3 ham5)))
    and ham2 = lazy (force (map x2 hamming))
    and ham3 = lazy (force (map x3 hamming))
    and ham5 = lazy (force (map x5 hamming))
;;

iter_interval pr hamming (88000, 88100)

;; Mt.from_pair_suites __FILE__ [
  "output", (fun _ -> 
      Eq (Buffer.contents buf, {|6726050156250000000000000000000000000
6729216728661136606575523242669244416
6730293634611118019721084375000000000
6731430439413948088320000000000000000
6733644878411293029785156250000000000
6736815026358904613608094481682268160
6739031236724077363200000000000000000
6743282904874568941599068856042651648
6744421903677486140423997176256921600
6746640616477458432000000000000000000
6750000000000000000000000000000000000
6750897085400702945836103937453588480
6752037370304563380023474956271616000
6754258588364960445000000000000000000
6755399441055744000000000000000000000
6757621765136718750000000000000000000
6758519863481752323552044362431792300
6759661435938757375539248533340160000
6761885162088395001166534423828125000
6763027302973440000000000000000000000
6765252136392518877983093261718750000
6767294110289640371843415775641600000
6768437164792816653010961694720000000
6770663777894400000000000000000000000
6774935403077748181101173538816000000
6776079748261363229431903027200000000
6778308875544000000000000000000000000
6782585324034592562287109312160000000
6783730961356018699387011072000000000
6785962605658597412109375000000000000
6789341568946838378906250000000000000
6791390813820928754681118720000000000
6794772480000000000000000000000000000
6799059315411241693033267200000000000
6800207735332289107722240000000000000
6802444800000000000000000000000000000
6806736475893120841673472000000000000
6807886192552970708582400000000000000
6810125783203125000000000000000000000
6814422305043756994967597929687500000
6815573319906622439424000000000000000
6817815439391434192657470703125000000
6821025214188390921278195662703296512
6821210263296961784362792968750000000
6823269127183128330240000000000000000
6828727177473454717179297140960133120
6830973624183426662400000000000000000
6834375000000000000000000000000000000
6835283298968211732659055236671758336
6836437837433370422273768393225011200
6838686820719522450562500000000000000
6839841934068940800000000000000000000
6842092037200927734375000000000000000
6844157203887991842733489140006912000
6845313241232438768082197309030400000
6847565144260608000000000000000000000
6849817788097425363957881927490234375
6851885286668260876491458472837120000
6853042629352726861173598715904000000
6855297075118080000000000000000000000
6859622095616220033364938208051200000
6860780745114630269799801815040000000
6863037736488300000000000000000000000
6866455078125000000000000000000000000
6867367640585024969315698178562000000
6868527598372968933129348710400000000
6870787138229329879760742187500000000
6871947673600000000000000000000000000
6874208338558673858642578125000000000
6876283198993690364114632704000000000
6879707136000000000000000000000000000
6884047556853882214196183040000000000
6885210332023942721568768000000000000
6887475360000000000000000000000000000
6891820681841784852194390400000000000
6892984769959882842439680000000000000
6895252355493164062500000000000000000
6899602583856803957404692903808593750
6900767986405455219916800000000000000
6903038132383827120065689086914062500
6906475391588173806667327880859375000
6908559991272917434368000000000000000
6912000000000000000000000000000000000
6914086267191872901144038355222134784
6916360794485719495680000000000000000
6917529027641081856000000000000000000
6919804687500000000000000000000000000
6921893310401287552552190498140323840
6924170405978516481194531250000000000
6925339958244802560000000000000000000
6927618187665939331054687500000000000
6929709168936591740767657754256998400
6930879656747844252683224775393280000
6933159708563865600000000000000000000
6937533852751614137447601703747584000
6938705662219635946938268699852800000
6940988288557056000000000000000000000
6945367371811422783781999935651840000
6946540504428563148172299337728000000
6948825708194403750000000000000000000
|})
    )
]