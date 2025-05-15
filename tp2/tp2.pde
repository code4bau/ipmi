PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
PImage fondo6; // Variable para la nueva imagen
PImage fondo7; // Variable para la nueva imagen
PImage fondo8; // Variable para la nueva imagen
float despYTexto;
float tamFont;
float despXTexto;

void setup() {
  size(640, 480);
  // Cargamos las imágenes
  fondo1 = loadImage("data/fondo1.jpg");
  fondo2 = loadImage("data/fondo2.jpg");
  fondo3 = loadImage("data/fondo3.jpg");
  fondo4 = loadImage("data/fondo4.jpg");
  fondo5 = loadImage("data/fondo5.jpg");
  fondo6 = loadImage("data/fondo6.jpg"); // Carga la sexta imagen
  fondo7 = loadImage("data/fondo7.jpg"); // Carga la séptima imagen
  fondo8 = loadImage("data/fondo8.jpg"); // Carga la octava imagen

  // Es buena práctica verificar si las imágenes se cargaron correctamente
  if (fondo1 == null || fondo2 == null || fondo3 == null || fondo4 == null || fondo5 == null || fondo6 == null || fondo7 == null || fondo8 == null) {
    println("Error: Asegúrate de que todas las imágenes (fondo1.jpg a fondo8.jpg) estén en la carpeta 'data' y los nombres sean correctos.");
    // Puedes detener el sketch si no cargan las imágenes
    // exit();
  }

  // Inicializamos las variables de control
  despYTexto = 1;
  tamFont = 1;
  despXTexto = 1;
}

void draw() {
  // --- Fase 1: Animación de tamaño de texto con fondo1 ---
  if (tamFont < 30) {
    tamFont = tamFont + 0.1;
    image(fondo1, 0, 0, 640, 480);
    fill(218);
    textSize(tamFont);
    text("Robotech\n es una serie animada de 1985\n creada por Carl Macek \n fusionando y adaptando \ntres series de animación japonesa", 100, 125);
  }
  // --- Fase 2: Animación de posición X de texto con fondo2 ---
  else if (despXTexto < 30) {
    despXTexto = despXTexto + 0.1;
    image(fondo2, 0, 0, 640, 480);
    fill(218);
    textSize(25);
    text("Narra la historia de la humanidad\n a lo largo de varias décadas \n comenzando con el descubrimiento\n de una avanzada tecnología alienígena \n la Robotecnología \n a partir de una nave espacial estrellada.", despXTexto, 100);
  }
  // --- Fase 3: Animación de posición Y de texto y cambio secuencial de fondos (3 a 8) ---
  else { // Este bloque se ejecuta SÓLO cuando las animaciones de tamFont y despXTexto han terminado.
    despYTexto = despYTexto + 0.3; // Continuamos incrementando despYTexto

    // Define los umbrales numéricos en despYTexto para cada cambio de fondo.
    // AJUSTA ESTOS VALORES según cuánto tiempo quieres que dure cada fondo.
    float umbralFondo4 = 100; // fondo3 se muestra mientras despYTexto < 100
    float umbralFondo5 = 180; // fondo4 se muestra mientras despYTexto está entre 100 y < 180
    float umbralFondo6 = 260; // fondo5 se muestra mientras despYTexto está entre 180 y < 260
    float umbralFondo7 = 340; // fondo6 se muestra mientras despYTexto está entre 260 y < 340
    float umbralFondo8 = 420; // fondo7 se muestra mientras despYTexto está entre 340 y < 420
    // fondo8 se mostrará cuando despYTexto sea >= 420

    fill(218); // Color del texto
    textSize(25); // Tamaño del texto

    if (despYTexto < umbralFondo4) {
      image(fondo3, 0, 0, 640, 480);
       text("Esta saga inicial establece el tono \n siguiendo a personajes clave \n como pilotos y oficiales \n mientras luchan por sobrevivir", 50, despYTexto);
    }
    else if (despYTexto < umbralFondo5){
      image(fondo4, 0, 0, 640, 480);
      text("Descubren que los Zentradi \n son guerreros clonados gigantes\n sin entender emociones ni cultura \n lo que los hace vulnerables", 100, despYTexto);
    }
    else if (despYTexto < umbralFondo6) {
      image(fondo5, 0, 0, 640, 480);
      // Nota: Aquí usé despYTexto para la Y del texto, asumiendo que quieres que se mueva con el fondo.
      text("Esta primera gran guerra culmina \n en una batalla apocalíptica que redibuja el planeta \n y mezcla humanos y Zentradi", 100, despYTexto);
    }
    else if (despYTexto < umbralFondo7) {
      image(fondo6, 0, 0, 640, 480);
      // Añade aquí el texto correspondiente a fondo6
      text("Texto para fondo6", 100, despYTexto); // Ejemplo de texto y posición
    }
    else if (despYTexto < umbralFondo8) {
      image(fondo7, 0, 0, 640, 480);
      // Añade aquí el texto correspondiente a fondo7
      text("Texto para fondo7", 100, despYTexto); // Ejemplo de texto y posición
    }
    else { // Si despYTexto es >= umbralFondo8, mostramos el último fondo (fondo8)
      image(fondo8, 0, 0, 640, 480);
      // Añade aquí el texto correspondiente a fondo8
      text("Texto para fondo8", 100, despYTexto); // Ejemplo de texto y posición
      // Si la animación debe terminar aquí, podrías añadir lógica para detener el loop o pasar a otra pantalla.
    }
  }

  // Imprime despYTexto en la consola para ver su valor y ajustar los umbrales
  println(despYTexto);
}
