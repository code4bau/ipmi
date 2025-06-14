// https://youtu.be/f7CcrydRCy0
PImage imgReferencia;
String nombreArchivoReferencia = "M_21.png";
int anchoPanelReferencia = 400;
int anchoPanelOpArt = 400;


color colorA_inicial = color(0);   
color colorB_inicial = color(255); 


float centroSI_inicialX, centroSI_inicialY;
float centroSD_inicialX, centroSD_inicialY;
float centroII_inicialX, centroII_inicialY;
float centroID_inicialX, centroID_inicialY;


color colorA, colorB;

float focoSIx, focoSIy;
float focoSDx, focoSDy;
float focoIIx, focoIIy;
float focoIDx, focoIDy;


void setup() {
  size(800, 400);

  imgReferencia = loadImage(nombreArchivoReferencia);
  if (imgReferencia != null) {
    imgReferencia.resize(anchoPanelReferencia, height);
  }

  float centroPanelX = anchoPanelOpArt / 2.0;
  float centroPanelY = height / 2.0;
  

  centroSI_inicialX = centroPanelX;
  centroSI_inicialY = centroPanelY;
  centroSD_inicialX = centroPanelX;
  centroSD_inicialY = centroPanelY;
  centroII_inicialX = centroPanelX;
  centroII_inicialY = centroPanelY;
  centroID_inicialX = centroPanelX;
  centroID_inicialY = centroPanelY;
  

  focoSIx = centroPanelX;
  focoSIy = centroPanelY;
  focoSDx = centroPanelX;
  focoSDy = centroPanelY;
  focoIIx = centroPanelX;
  focoIIy = centroPanelY;
  focoIDx = centroPanelX;
  focoIDy = centroPanelY;

  reiniciarValores();
  rectMode(CORNER);
  textAlign(CENTER, CENTER);
}


void draw() {
  background(0);

  if (imgReferencia != null) {
    image(imgReferencia, 0, 0);
  } else {
    fill(50); 
    noStroke(); 
    rect(0, 0, anchoPanelReferencia, height);
    fill(255); 
    text("No se encontró\n'" + nombreArchivoReferencia + "'\nen la carpeta 'data'", anchoPanelReferencia / 2, height / 2);
  }


  float mouseRelX = mouseX - anchoPanelReferencia;
  float mouseRelY = mouseY;
  
  float centroPanelX = anchoPanelOpArt / 2.0;
  float centroPanelY = height / 2.0;
  float suavidad = 0.1; 


  if (mouseRelX > 0 && mouseRelX < centroPanelX && mouseRelY > 0 && mouseRelY < centroPanelY) {
    focoSIx += (mouseRelX - focoSIx) * suavidad;
    focoSIy += (mouseRelY - focoSIy) * suavidad;
    focoSDx += (centroSD_inicialX - focoSDx) * suavidad;
    focoSDy += (centroSD_inicialY - focoSDy) * suavidad;
    focoIIx += (centroII_inicialX - focoIIx) * suavidad;
    focoIIy += (centroII_inicialY - focoIIy) * suavidad;
    focoIDx += (centroID_inicialX - focoIDx) * suavidad;
    focoIDy += (centroID_inicialY - focoIDy) * suavidad;
  } else if (mouseRelX >= centroPanelX && mouseRelX < anchoPanelOpArt && mouseRelY > 0 && mouseRelY < centroPanelY) {
    focoSDx += (mouseRelX - focoSDx) * suavidad;
    focoSDy += (mouseRelY - focoSDy) * suavidad;
    focoSIx += (centroSI_inicialX - focoSIx) * suavidad;
    focoSIy += (centroSI_inicialY - focoSIy) * suavidad;
    focoIIx += (centroII_inicialX - focoIIx) * suavidad;
    focoIIy += (centroII_inicialY - focoIIy) * suavidad;
    focoIDx += (centroID_inicialX - focoIDx) * suavidad;
    focoIDy += (centroID_inicialY - focoIDy) * suavidad;
  } else if (mouseRelX > 0 && mouseRelX < centroPanelX && mouseRelY >= centroPanelY && mouseRelY < height) {
    focoIIx += (mouseRelX - focoIIx) * suavidad;
    focoIIy += (mouseRelY - focoIIy) * suavidad;
    focoSIx += (centroSI_inicialX - focoSIx) * suavidad;
    focoSIy += (centroSI_inicialY - focoSIy) * suavidad;
    focoSDx += (centroSD_inicialX - focoSDx) * suavidad;
    focoSDy += (centroSD_inicialY - focoSDy) * suavidad;
    focoIDx += (centroID_inicialX - focoIDx) * suavidad;
    focoIDy += (centroID_inicialY - focoIDy) * suavidad;
  } else if (mouseRelX >= centroPanelX && mouseRelX < anchoPanelOpArt && mouseRelY >= centroPanelY && mouseRelY < height) {
    focoIDx += (mouseRelX - focoIDx) * suavidad;
    focoIDy += (mouseRelY - focoIDy) * suavidad;
    focoSIx += (centroSI_inicialX - focoSIx) * suavidad;
    focoSIy += (centroSI_inicialY - focoSIy) * suavidad;
    focoSDx += (centroSD_inicialX - focoSDx) * suavidad;
    focoSDy += (centroSD_inicialY - focoSDy) * suavidad;
    focoIIx += (centroII_inicialX - focoIIx) * suavidad;
    focoIIy += (centroII_inicialY - focoIIy) * suavidad;
  } else { 
    focoSIx += (centroSI_inicialX - focoSIx) * suavidad;
    focoSIy += (centroSI_inicialY - focoSIy) * suavidad;
    focoSDx += (centroSD_inicialX - focoSDx) * suavidad;
    focoSDy += (centroSD_inicialY - focoSDy) * suavidad;
    focoIIx += (centroII_inicialX - focoIIx) * suavidad;
    focoIIy += (centroII_inicialY - focoIIy) * suavidad;
    focoIDx += (centroID_inicialX - focoIDx) * suavidad;
    focoIDy += (centroID_inicialY - focoIDy) * suavidad;
  }

  int paso = 2;
  for (int x = 0; x < anchoPanelOpArt; x += paso) {
    for (int y = 0; y < height; y += paso) {
      color colorCuadrado = determinarColorPerspectiva(x, y);
        dibujarElemento(x, y, paso, colorCuadrado);
    }
  }
}


void dibujarElemento(int x, int y, int tamano, color c)   {
  noStroke();
  fill(c);
  rect(x + anchoPanelReferencia, y, tamano, tamano);
}

color determinarColorPerspectiva(int x, int y) {
  float grosorBanda = 15;  
  float centroPanelX = anchoPanelOpArt / 2.0;
  float centroPanelY = height / 2.0;
  
  float focoActualX, focoActualY;
  
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
  
  float distAlFoco = max(abs(x - focoActualX), abs(y - focoActualY));
  int numeroBanda = int(distAlFoco / grosorBanda);
  
  color colorBase = (numeroBanda % 2 == 0) ? colorB : colorA;
  
  boolean enCuadranteSuperior = (y < centroPanelY);
  boolean enCuadranteIzquierdo = (x < centroPanelX);
  
  if (enCuadranteSuperior != enCuadranteIzquierdo) {
    return (colorBase == colorA) ? colorB : colorA;
  } else {
    return colorBase;
  }
}

void mousePressed() {
  if (mouseX > anchoPanelReferencia) {
    color temp = colorA;
    colorA = colorB;
    colorB = temp;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciarValores();
  }
}

void reiniciarValores() {
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
  
  println("Valores y perspectiva reiniciados.");
}
