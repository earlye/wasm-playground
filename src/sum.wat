(module
  (func
    ;; signature
    (export "add_i32_i32")
    (param $left i32)
    (param $right i32)
    (result i32)
    ;; body
    local.get $left
    local.get $right
    i32.add
  )
)