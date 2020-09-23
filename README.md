# WIP-DSP

Inspired by: https://github.com/shamadee/web-dsp.

Doesn't matter will use opencv eventually...
Nice learning project.

## References

### Install

Clone this repo and drop only the 'lib' folder into your project. Simply load our library file in a script tag. You can also get the module via `npm install web-dsp`, which comes with a built-in npm executable (`get-dsp`), which will copy the lib folder into your project directory.

```html
<script src = '/lib/webdsp.js' type = 'text/javascript'>
```

### Loading the WebAssembly Module

Use loadWASM() to fetch the WebAssembly module as a promise object.
Use jsFallback() in the catch block to handle browsers that don't support .wasm

```javascript
var webdsp = {};
loadWASM().then(module => {
  webdsp = module;
  // things to execute on page load only after module is loaded
});
```

Note WebAssembly modules need to be loaded with an HTTP request (fetch). Chrome does not support local file access via HTTP, so the files must be loaded using a server. In Firefox, it is possible to load the module without a server as a plain HTML file.

After loading, a WebAssembly method can be called with plain JS:

```javascript
//get image data from canvas
pixels = context.getImageData(0,0,width,height);
button.addEventListener('click', () => {
  pixels.data.set(webdsp.invert(pixels.data));
});
```

### Video and Image Filter Methods

These modular filters can execute on an array of RGBA pixel data:

`webdsp.grayScale(pixelData)`
`webdsp.brighten(pixelData)`
`webdsp.invert(pixelData)`
`webdsp.noise(pixelData)`
`webdsp.sobelFilter(pixelData, width, height, invert=false)`
`webdsp.convFilter(pixelData, width, height, kernel, divisor, bias=0, count=1)`
`webdsp.multiFilter(pixelData, width, filterType, mag, multiplier, adjacentgit )`

Filter templates:

`webdsp.sunset(pixelData, width)`
`webdsp.analogTV(pixelData, width)`
`webdsp.emboss(pixelData, width)`
`webdsp.blur(pixelData, width, height)`
`webdsp.sharpen(pixelData, width, height))`
`webdsp.strongSharpen(pixelData, width, height)`
`webdsp.clarity(pixelData, width, height)`
`webdsp.goodMorning(pixelData, width, height)`
`webdsp.acid(pixelData, width, height)`
`webdsp.urple(pixelData, width)`
`webdsp.forest(pixelData, width)`
`webdsp.romance(pixelData, width)`
`webdsp.hippo(pixelData, width)`
`webdsp.longhorn(pixelData, width)`
`webdsp.underground(pixelData, width)`
`webdsp.rooster(pixelData, width)`
`webdsp.mist(pixelData, width)`
`webdsp.tingle(pixelData, width)`
`webdsp.bacteria(pixelData, width)`
`webdsp.dewdrops(pixelData, width, height)`
`webdsp.destruction(pixelData, width, height)`
`webdsp.hulk(pixelData, width)`
`webdsp.ghost(pixelData, width)`
`webdsp.twisted(pixelData, width)`
`webdsp.security(pixelData, width)`

For production level environments, it's important to note that all available methods have JavaScript fallback functions that are automatically exported with the module so older browsers can still run your code. However, note that the more intensive convolution and edge detection filters will run very slowly or hang the browser completely without WebAssembly support. 

### TODO

The following filter fallback implementations need to be properly matched with their C++ counterparts: underground, rooster, mist, kaleidoscope, bacteria, hulk edge, ghost, twisted.
Cache .wasm module on client

### Collaborators: [Deep Pulusani](https://github.com/sdeep27), [Shahrod Khalkhali](https://github.com/shahrodkh), [Matthias Wagner](https://github.com/matzewagner)
