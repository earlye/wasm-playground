import {wasmLoad} from "./wasmLoad.js"


const wasmInjections = {
  env: {
    memory: new WebAssembly.Memory({initial: 1}), // 1 page = 64KB
    print_string: (offset, len) => {
      const bytes = new Uint8Array(wasmInjections.env.memory.buffer, offset, len);
      const str = new TextDecoder('utf8').decode(bytes);
      console.log(str);
    },
  }
};

const module = await wasmLoad("./hello.wasm", wasmInjections)
module.instance.exports.helloWorld();
