(module
 (import "env" "increment_f64" (func $js_increment_f64 (result f64)))
 
 (global $value (mut f64) (f64.const 0))
 (global $nop_value (mut f64) (f64.const 0))

 (func $wasm_increment_f64 (result f64)
       (global.set $value (f64.add (f64.const 1) (global.get $value)))
       global.get $value
       return
       )


 (func (export "loop_wasm_inline")
       (loop $continue
        (global.set $nop_value (f64.add (f64.const 1) (global.get $nop_value)))
        global.get $nop_value
        f64.const 4_000_000
        f64.le
        br_if $continue
        ))        
 
 (func (export "loop_wasm")
       (loop $continue
        (call $wasm_increment_f64)
        f64.const 4_000_000
        f64.le
        br_if $continue
        ))
 
 (func (export "loop_js")
       (loop $continue
        (call $js_increment_f64)
        f64.const 4_000_000
        f64.le
        br_if $continue
        ))
 
)
