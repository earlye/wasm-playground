(module
 (import "env" "print_string" (func $print_string (param i32) (param i32))) ;; print_string(i32,i32)
 (import "env" "memory" (memory 1)) ;; linear memory, block 0

 ;; initialize linear memory
 (global $string_len i32 (i32.const 12))
 (global $string_offset i32 (i32.const 0))
 (data (memory 0) (global.get $string_offset) "hello world!")

 ;; do the thing.
 (func (export "helloWorld")
       (call $print_string (global.get $string_offset) (global.get $string_len)))
)
