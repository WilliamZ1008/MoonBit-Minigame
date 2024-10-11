# moonbit/demo

moon build --target wasm
npx wasm4 run .\target\wasm\release\build\lib\lib.wasm

npx wasm4 bundle --html game.html .\target\wasm\release\build\lib\lib.wasm

    0b00000000,
    0b01000010,
    0b00000000,
    0b00000000,
    0b10000001,
    0b01111110,
    0b00000000,
    0b00000000,