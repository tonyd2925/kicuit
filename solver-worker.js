// Solveur du Rubik's Cube (bibliothèque cubejs, algorithme en deux phases de Kociemba).
importScripts('vendor/cubejs/cube.js', 'vendor/cubejs/solve.js');
let ready = false;
self.onmessage = e => {
  const d = e.data;
  try {
    if (!ready) { Cube.initSolver(); ready = true; }
    if (d.cmd === 'init') return self.postMessage({ cmd: 'init' });
    if (d.cmd === 'solve') return self.postMessage({ cmd: 'solve', sol: Cube.fromString(d.state).solve() });
  } catch (err) {
    self.postMessage({ cmd: 'error', msg: String(err) });
  }
};
