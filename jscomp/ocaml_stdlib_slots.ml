let pervasives = [| "invalid_arg";"failwith";"Exit";"min";"max";"abs";"max_int";"min_int";"lnot";"infinity";"neg_infinity";"nan";"max_float";"min_float";"epsilon_float";"^";"char_of_int";"string_of_bool";"bool_of_string";"string_of_int";"string_of_float";"@";"stdin";"stdout";"stderr";"print_char";"print_string";"print_bytes";"print_int";"print_float";"print_endline";"print_newline";"prerr_char";"prerr_string";"prerr_bytes";"prerr_int";"prerr_float";"prerr_endline";"prerr_newline";"read_line";"read_int";"read_float";"open_out";"open_out_bin";"open_out_gen";"flush";"flush_all";"output_char";"output_string";"output_bytes";"output";"output_substring";"output_byte";"output_binary_int";"output_value";"seek_out";"pos_out";"out_channel_length";"close_out";"close_out_noerr";"set_binary_mode_out";"open_in";"open_in_bin";"open_in_gen";"input_char";"input_line";"input";"really_input";"really_input_string";"input_byte";"input_binary_int";"input_value";"seek_in";"pos_in";"in_channel_length";"close_in";"close_in_noerr";"set_binary_mode_in";"LargeFile";"string_of_format";"^^";"exit";"at_exit";"valid_float_lexem";"unsafe_really_input";"do_at_exit" |]
let camlinternalOO = [| "public_method_label";"new_method";"new_variable";"new_methods_variables";"get_variable";"get_variables";"get_method_label";"get_method_labels";"get_method";"set_method";"set_methods";"narrow";"widen";"add_initializer";"dummy_table";"create_table";"init_class";"inherits";"make_class";"make_class_store";"dummy_class";"copy";"create_object";"create_object_opt";"run_initializers";"run_initializers_opt";"create_object_and_run_initializers";"lookup_tables";"params";"stats" |]
let camlinternalMod = [| "init_mod";"update_mod" |]
let string = [| "make";"init";"copy";"sub";"fill";"blit";"concat";"iter";"iteri";"map";"mapi";"trim";"escaped";"index";"rindex";"index_from";"rindex_from";"contains";"contains_from";"rcontains_from";"uppercase";"lowercase";"capitalize";"uncapitalize";"compare" |]
let array = [| "init";"make_matrix";"create_matrix";"append";"concat";"sub";"copy";"fill";"blit";"to_list";"of_list";"iter";"map";"iteri";"mapi";"fold_left";"fold_right";"sort";"stable_sort";"fast_sort" |]
let list = [| "length";"hd";"tl";"nth";"rev";"append";"rev_append";"concat";"flatten";"iter";"iteri";"map";"mapi";"rev_map";"fold_left";"fold_right";"iter2";"map2";"rev_map2";"fold_left2";"fold_right2";"for_all";"exists";"for_all2";"exists2";"mem";"memq";"find";"filter";"find_all";"partition";"assoc";"assq";"mem_assoc";"mem_assq";"remove_assoc";"remove_assq";"split";"combine";"sort";"stable_sort";"fast_sort";"sort_uniq";"merge" |]
