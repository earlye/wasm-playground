import {wasmLoad} from "./wasmLoad.js"

const module = await wasmLoad("./sum.wasm")
const result = module.instance.exports.add_i32_i32(1,2)
console.log({result})
