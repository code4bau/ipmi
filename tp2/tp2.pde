PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
float despYTexto;
float tamFont;
float despXTexto;
float textoYPos;

void setup() {
  size(640, 480);
  // Cargamos las imágenes
  fondo1 = loadImage("data/fondo1.jpg");
  fondo2 = loadImage("data/fondo2.jpg");
  fondo3 = loadImage("data/fondo3.jpg");
  fondo4 = loadImage("data/fondo4.jpg");
  fondo5 = loadImage("data/fondo5.jpg");
  // Inicializamos las variables de control
  despYTexto = 1;
  tamFont = 1;
  despXTexto = 1;
  textoYPos = height;
}

void draw() {

  if (tamFont < 30) {
    tamFont = tamFont + 0.1; // Incrementamos tamFont
    image(fondo1, 0, 0, 640, 480); // Mostramos fondo1
    fill(218); // Color del texto
    textSize(tamFont); // Tamaño del texto animado
    text("Robotech\n es una serie animada de 1985\n creada por Carl Macek \n fusionando y adaptando \ntres series de animación japonesa", 100, 125);
  }
  else if (despXTexto < 30) {
    despXTexto = despXTexto + 0.1; 
    image(fondo2, 0, 0, 640, 480); 
    fill(218); 
    textSize(25);
    text("Narra la historia de la humanidad\n a lo largo de varias décadas \n comenzando con el descubrimiento\n de una avanzada tecnología alienígena \n la Robotecnología \n a partir de una nave espacial estrellada.", despXTexto, 100);
  }
  else if (despYTexto < height/2) {
    despYTexto = despYTexto + 0.3; 
    fill(218); 
    textSize(25); 

    if (despYTexto < 100) {
      image(fondo3, 0, 0, 640, 480); 
       text("Esta saga inicial establece el tono \n siguiendo a personajes clave \n como pilotos y oficiales \n mientras luchan por sobrevivir", 50, despYTexto);
    } 
    else if (despYTexto >= 100){ 
      image(fondo4, 0, 0, 640, 480); 
      text("Descubren que los Zentradi \n son guerreros clonados gigantes\n sin entender emociones ni cultura \n lo que los hace vulnerables", 100, despYTexto);
    } 
    else if (despYTexto >= 180)  {
      image(fondo5, 0, 0, 640, 480); 
      text("Esta primera gran guerra culmina \n en una batalla apocalíptica que redibuja el planeta \n y mezcla humanos y Zentradi", 100, despXTexto);
    }
  }
  println(despYTexto);
}
