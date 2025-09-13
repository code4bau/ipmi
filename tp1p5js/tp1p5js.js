//https://youtu.be/kuJmzvFG5LQ

let imgReferencia;
let nombreArchivoReferencia = "M_21.png";
let anchoPanelReferencia = 400;
let anchoPanelOpArt = 400;

let colorA_inicial, colorB_inicial;
let colorA, colorB;

let centroSI_inicialX, centroSI_inicialY;
let centroSD_inicialX, centroSD_inicialY;
let centroII_inicialX, centroII_inicialY;
let centroID_inicialX, centroID_inicialY;

let focoSIx, focoSIy;
let focoSDx, focoSDy;
let focoIIx, focoIIy;
let focoIDx, focoIDy;

function preload() {
  imgReferencia = loadImage(nombreArchivoReferencia, 
    () => console.log("Imagen de referencia cargada."),
    () => {
      console.error(`Error: No se encontró '${nombreArchivoReferencia}'.`);
      imgReferencia = null; 
    }
  );
}
function setup() {
createCanvas(800, 400);

  colorA_inicial = color(0);
  colorB_inicial = color(255);

  if (imgReferencia) {
    imgReferencia.resize(anchoPanelReferencia, height);
  }

  let centroPanelX = anchoPanelOpArt / 2.0;
  let centroPanelY = height / 2.0;

  centroSI_inicialX = centroPanelX;
  centroSI_inicialY = centroPanelY;
  centroSD_inicialX = centroPanelX;
  centroSD_inicialY = centroPanelY;
  centroII_inicialX = centroPanelX;
  centroII_inicialY = centroPanelY;
  centroID_inicialX = centroPanelX;
  centroID_inicialY = centroPanelY;

  reiniciarValores();
  rectMode(CORNER);
  textAlign(CENTER, CENTER);
}

function draw() {
  background(0);

  if (imgReferencia) {
    image(imgReferencia, 0, 0);
  } else {
    push(); 
    fill(50);
    noStroke();
    rect(0, 0, anchoPanelReferencia, height);
    fill(255);
    text(`No se encontró\n'${nombreArchivoReferencia}'`, anchoPanelReferencia / 2, height / 2);
    pop(); 
  }

  let mouseRelX = mouseX - anchoPanelReferencia;
  let mouseRelY = mouseY;
  let centroPanelX = anchoPanelOpArt / 2.0;
  let centroPanelY = height / 2.0;
  let suavidad = 0.1;


  if (mouseRelX > 0 && mouseRelX < centroPanelX && mouseRelY > 0 && mouseRelY < centroPanelY) { 
    focoSIx += (mouseRelX - focoSIx) * suavidad;
    focoSIy += (mouseRelY - focoSIy) * suavidad;
  } else if (mouseRelX >= centroPanelX && mouseRelX < anchoPanelOpArt && mouseRelY > 0 && mouseRelY < centroPanelY) { 
    focoSDx += (mouseRelX - focoSDx) * suavidad;
    focoSDy += (mouseRelY - focoSDy) * suavidad;
  } else if (mouseRelX > 0 && mouseRelX < centroPanelX && mouseRelY >= centroPanelY && mouseRelY < height) { 
    focoIIx += (mouseRelX - focoIIx) * suavidad;
    focoIIy += (mouseRelY - focoIIy) * suavidad;
  } else if (mouseRelX >= centroPanelX && mouseRelX < anchoPanelOpArt && mouseRelY >= centroPanelY && mouseRelY < height) { 
    focoIDx += (mouseRelX - focoIDx) * suavidad;
    focoIDy += (mouseRelY - focoIDy) * suavidad;
  }
  
  focoSIx += (centroSI_inicialX - focoSIx) * suavidad;
  focoSIy += (centroSI_inicialY - focoSIy) * suavidad;
  focoSDx += (centroSD_inicialX - focoSDx) * suavidad;
  focoSDy += (centroSD_inicialY - focoSDy) * suavidad;
  focoIIx += (centroII_inicialX - focoIIx) * suavidad;
  focoIIy += (centroII_inicialY - focoIIy) * suavidad;
  focoIDx += (centroID_inicialX - focoIDx) * suavidad;
  focoIDy += (centroID_inicialY - focoIDy) * suavidad;

  let paso = 4;
  for (let x = 0; x < anchoPanelOpArt; x += paso) {
    for (let y = 0; y < height; y += paso) {
      let colorCuadrado = determinarColorPerspectiva(x, y);
      dibujarElemento(x, y, paso, colorCuadrado);
    }
  }
}

function dibujarElemento(x, y, tamano, c) {
  noStroke();
  fill(c);
  rect(x + anchoPanelReferencia, y, tamano, tamano);
}

function determinarColorPerspectiva(x, y) {
  let grosorBanda = 15;
  let centroPanelX = anchoPanelOpArt / 2.0;
  let centroPanelY = height / 2.0;

  let focoActualX, focoActualY;

  if (x < centroPanelX && y < centroPanelY) {
    focoActualX = focoSIx;
    focoActualY = focoSIy;
  } else if (x >= centroPanelX && y < centroPanelY) {
    focoActualX = focoSDx;
    focoActualY = focoSDy;
  } else if (x < centroPanelX && y >= centroPanelY) {
    focoActualX = focoIIx;
    focoActualY = focoIIy;
  } else {
    focoActualX = focoIDx;
    focoActualY = focoIDy;
  }

  let distAlFoco = max(abs(x - focoActualX), abs(y - focoActualY));
  
  let numeroBanda = floor(distAlFoco / grosorBanda);

  let colorBase = (numeroBanda % 2 === 0) ? colorB : colorA;

  let enCuadranteSuperior = (y < centroPanelY);
  let enCuadranteIzquierdo = (x < centroPanelX);

  if (enCuadranteSuperior !== enCuadranteIzquierdo) {
    return (colorBase === colorA) ? colorB : colorA;
  } else {
    return colorBase;
  }
}

function mousePressed() {
  if (mouseX > anchoPanelReferencia && mouseX < width) {
    let temp = colorA;
    colorA = colorB;
    colorB = temp;
  }
}

function keyPressed() {
  if (key === 'r' || key === 'R') {
    reiniciarValores();
  }
}

function reiniciarValores() {
  colorA = colorA_inicial;
  colorB = colorB_inicial;

  focoSIx = centroSI_inicialX;
  focoSIy = centroSI_inicialY;
  focoSDx = centroSD_inicialX;
  focoSDy = centroSD_inicialY;
  focoIIx = centroII_inicialX;
  focoIIy = centroII_inicialY;
  focoIDx = centroID_inicialX;
  focoIDy = centroID_inicialY;

  console.log("Valores y perspectiva reiniciados.");
}
