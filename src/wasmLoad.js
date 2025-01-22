import fs from "node:fs/promises";

const portaGet = async (url) => {
  url = import.meta.resolve(url);
  url = new URL(url);
  if (url.protocol === "file:") {
    const data = await fs.readFile(url);
    return data;
  } else {
    throw new Error("fetch not yet implemented");
  }
};

export const wasmLoad = async (url, injections, compileOptions) => {
  const moduleBytes = await portaGet(url);
  const module = await WebAssembly.instantiate(moduleBytes, injections, compileOptions);
  console.log({
    msg:"loaded wasm",
    url: url,
    injections,
    module,
    exports: module.instance.exports
  });
  return module;
}
