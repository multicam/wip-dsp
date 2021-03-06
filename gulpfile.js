const bs = require('browser-sync').create()
const exec = require('child_process').exec
const {task, watch, series, parallel} = require ('gulp')

const log = console.log
const getCompileCommand = () => '. ./compileWASM.sh'

const fnCompile = cb => {
  const compileCommand = getCompileCommand();
  return exec(compileCommand, (err, stdout, stderr) => {
    log(stderr);
    log(stdout);
    cb(err);
    bs.reload();
  });
}

const fnBrowserSync = () => {
  bs.init({
    server: {
      port: 6000,
      baseDir: './'
    }
  });
}

const fnServer = () => child.spawn('node', ['server.js'])

task( 'browser-sync', series(fnCompile), fnBrowserSync );
task( 'compile', fnCompile );

watch(['cpp/webdsp.cpp','compileWASM.sh'], fnCompile )
watch(['index.html', 'demo.js', 'webdsp.js', 'style.css', 'compileWASM.sh'], () => {
  bs.reload();
});

task('default', series(fnCompile, fnBrowserSync))