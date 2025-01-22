import {wasmLoad} from "./wasmLoad.js"

let global = 0;
const module = await wasmLoad("./js-vs-wasm-fn.wasm", {
  env: {
    increment_f64: () => ++global
  }
});

const timeit = (fn) => {
  const before = performance.now()
  fn()
  const after = performance.now()
  console.log({before,after,diff:after - before,diff_per:(after-before)/4_000_000})
};

timeit(module.instance.exports.loop_wasm_inline);
timeit(module.instance.exports.loop_wasm);
timeit(module.instance.exports.loop_js);
