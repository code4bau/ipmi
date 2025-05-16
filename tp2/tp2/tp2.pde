PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
PImage fondo6;
PImage fondo7;
PImage fondo8;

// Variable para controlar el estado actual
int estadoActual = 1; // Empezamos con el estado 1 (fondo1)

// Variable para guardar el tiempo cuando comenzó el estado actual
long tiempoInicioEstado;

// Duración de cada estado en milisegundos (AJUSTA ESTOS VALORES)
// Estas son duraciones de ejemplo. Define cuánto quieres que dure cada pantalla.
long duracionEstado1 = 4000; // 4 segundos para el fondo 1
long duracionEstado2 = 4000; // 4 segundos para el fondo 2
long duracionEstado3 = 5000; // 5 segundos para el fondo 3
long duracionEstado4 = 5000; // 5 segundos para el fondo 4
long duracionEstado5 = 6000; // 6 segundos para el fondo 5
long duracionEstado6 = 6000; // 6 segundos para el fondo 6
long duracionEstado7 = 6000; // 6 segundos para el fondo 7
long duracionEstado8 = 8000; // 8 segundos para el fondo 8 (o hasta el final)


// Variables de animación para CADA fase de texto (se animan durante la duración del estado)
// Y variables de velocidad para esas animaciones
// Estado 1 (fondo1)
float tamFont1;
float velocidadTamFont1 = 0.1; // Velocidad a la que crece la fuente

// Estado 2 (fondo2)
float despXTexto2;
float velocidadDespXTexto2 = 0.1; // Velocidad del movimiento horizontal

// Estado 3 (fondo3)
float despYTexto3;
float velocidadDespYTexto3 = 0.5; // Velocidad del movimiento vertical

// Estado 4 (fondo4)
float despYTexto4;
float velocidadDespYTexto4 = -0.8; // Velocidad del scroll hacia arriba (negativo)

// Estado 5 (fondo5)
float despYTexto5;
float velocidadDespYTexto5 = -0.8; // Velocidad del scroll hacia arriba
float alfaTexto5;
float velocidadAlfaTexto5 = 2; // Velocidad del fundido (0 a 255)

// Estado 6 (fondo6)
float despXTexto6;
float velocidadDespXTexto6 = -1.5; // Velocidad del scroll hacia la izquierda
float tamFont6;
float velocidadTamFont6 = 0.05; // Velocidad del crecimiento de la fuente

// Estado 7 (fondo7)
float despYTexto7;
float velocidadDespYTexto7 = -0.5; // Velocidad del scroll hacia arriba lento
float colorTexto7;
float velocidadColorTexto7 = 1; // Velocidad del cambio de color

// Estado 8 (fondo8)
float alfaTexto8;
float velocidadAlfaTexto8 = 1.5; // Velocidad del fundido
float despYTexto8; // Posición fija, no necesita velocidad si no se mueve


void setup() {
  size(640, 480);
  // Cargamos las imágenes (igual que antes)
  fondo1 = loadImage("data/fondo1.jpg");
  fondo2 = loadImage("data/fondo2.jpg");
  fondo3 = loadImage("data/fondo3.jpg");
  fondo4 = loadImage("data/fondo4.jpg");
  fondo5 = loadImage("data/fondo5.jpg");
  fondo6 = loadImage("data/fondo6.jpg");
  fondo7 = loadImage("data/fondo7.jpg");
  fondo8 = loadImage("data/fondo8.jpg");

  // Verificación de carga (igual que antes)
  if (fondo1 == null || fondo2 == null || fondo3 == null || fondo4 == null || fondo5 == null || fondo6 == null || fondo7 == null || fondo8 == null) {
    println("Error: Asegúrate de que todas las imágenes (fondo1.jpg a fondo8.jpg) estén en la carpeta 'data' y los nombres sean correctos.");
    // exit(); // Puedes descomentar si quieres que el programa se detenga
  }

  // Inicializar el tiempo de inicio del primer estado
  tiempoInicioEstado = millis();

  // Inicialización de variables de animación a sus VALORES INICIALES para el ESTADO 1
  tamFont1 = 1;

  // Las variables de los otros estados no necesitan inicializarse AQUI con valores de animación,
  // se inicializarán justo antes de que su estado comience. Solo necesitamos inicializar las del estado 1.
  // Sin embargo, podemos darles un valor por defecto o un valor "seguro"
   despXTexto2 = 1; // Valor inicial para el estado 2
   despYTexto3 = 1; // Valor inicial para el estado 3
   despYTexto4 = height; // Valor inicial para el estado 4
   despYTexto5 = height + 50; // Valor inicial para el estado 5
   alfaTexto5 = 0; // Valor inicial para el estado 5
   despXTexto6 = width + 100; // Valor inicial para el estado 6
   tamFont6 = 10; // Valor inicial para el estado 6
   despYTexto7 = height; // Valor inicial para el estado 7
   colorTexto7 = 0; // Valor inicial para el estado 7
   alfaTexto8 = 0; // Valor inicial para el estado 8
   despYTexto8 = 200; // Posición fija para el estado 8 (o inicial si tuviera scroll)

}

void draw() {
  // Calcular el tiempo transcurrido en el estado actual
  long tiempoTranscurrido = millis() - tiempoInicioEstado;

  // Estructura IF/ELSE IF para manejar los estados
  if (estadoActual == 1) {
    // --- Estado 1: Fondo 1 y animación de tamaño ---
    image(fondo1, 0, 0, 640, 480);

    // Animar tamFont1 incrementalmente
    if (tamFont1 < 30) { // Parar la animación cuando alcance 30
      tamFont1 = tamFont1 + velocidadTamFont1;
    }

    fill(218);
    textSize(tamFont1);
    text("Robotech\n es una serie animada de 1985\n creada por Carl Macek \n fusionando y adaptando \ntres series de animación japonesa", 100, 125);

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado1) {
      estadoActual = 2;
      tiempoInicioEstado = millis(); // Resetear el tiempo para el nuevo estado
      // Reinicializar variables para el ESTADO 2 al hacer la transición
      despXTexto2 = 1; // Asegura que la animación X empiece desde 1
    }

  } else if (estadoActual == 2) {
    // --- Estado 2: Fondo 2 y animación de posición X ---
    image(fondo2, 0, 0, 640, 480);

    // Animar despXTexto2 incrementalmente
    if (despXTexto2 < 30) { // Parar la animación cuando alcance 30
      despXTexto2 = despXTexto2 + velocidadDespXTexto2;
    }

    fill(218);
    textSize(25);
    text("Narra la historia de la humanidad\n a lo largo de varias décadas \n comenzando con el descubrimiento\n de una avanzada tecnología alienígena \n la Robotecnología \n a partir de una nave espacial estrellada.", despXTexto2, 100);

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado2) {
      estadoActual = 3;
      tiempoInicioEstado = millis(); // Resetear el tiempo
      // Reinicializar variables para el ESTADO 3 al hacer la transición
      despYTexto3 = 1; // Asegura que la animación Y empiece desde 1
    }

  } else if (estadoActual == 3) {
    // --- Estado 3: Fondo 3 y animación de posición Y ---
    image(fondo3, 0, 0, 640, 480);

    // Animar despYTexto3 incrementalmente
     if (despYTexto3 < 200) { // Parar la animación cuando alcance 200
       despYTexto3 = despYTexto3 + velocidadDespYTexto3;
     }


    fill(218);
    textSize(25);
    text("Esta saga inicial establece el tono \n siguiendo a personajes clave \n como pilotos y oficiales \n mientras luchan por sobrevivir", 50, despYTexto3);

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado3) {
      estadoActual = 4;
      tiempoInicioEstado = millis(); // Resetear el tiempo
      // Reinicializar variables para el ESTADO 4 al hacer la transición
      despYTexto4 = height; // Asegura que empiece desde abajo
    }

  } else if (estadoActual == 4) {
    // --- Estado 4: Fondo 4 y animación de posición Y (scroll up) ---
    image(fondo4, 0, 0, 640, 480);

    // Animar despYTexto4 incrementalmente (velocidad negativa para scroll up)
    if (despYTexto4 > 100) { // Parar la animación cuando alcance 100
       despYTexto4 = despYTexto4 + velocidadDespYTexto4;
    }

    fill(218);
    textSize(25);
    text("Descubren que los Zentradi \n son guerreros clonados gigantes\n sin entender emociones ni cultura \n lo que los hace vulnerables", 100, despYTexto4);

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado4) {
      estadoActual = 5;
      tiempoInicioEstado = millis(); // Resetear el tiempo
      // Reinicializar variables para el ESTADO 5 al hacer la transición
      despYTexto5 = height + 50; // Empieza abajo
      alfaTexto5 = 0;            // Empieza transparente
    }

  } else if (estadoActual == 5) {
    // --- Estado 5: Fondo 5 y animación específica (scroll up y fundido) ---
    image(fondo5, 0, 0, 640, 480);

    // Animar la posición Y incrementalmente (velocidad negativa para scroll up)
    if (despYTexto5 > 100) { // Parar la animación cuando alcance 100
       despYTexto5 = despYTexto5 + velocidadDespYTexto5;
    }

    // Animar la transparencia incrementalmente
    if (alfaTexto5 < 255) { // Parar cuando alcance 255 (completamente visible)
      alfaTexto5 = alfaTexto5 + velocidadAlfaTexto5;
    }


    fill(0, 0, 0, alfaTexto5); // Usa alfa para el fundido
    textSize(28);
    text("Esta primera gran guerra culmina \n en una batalla apocalíptica que redibuja el planeta \n y mezcla humanos y Zentradi", 100, despYTexto5);

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado5) {
      estadoActual = 6;
      tiempoInicioEstado = millis(); // Resetear el tiempo
      // Reinicializar variables para el ESTADO 6 al hacer la transición
      despXTexto6 = width + 100; // Empieza a la derecha
      tamFont6 = 10;             // Tamaño inicial
    }

  } else if (estadoActual == 6) {
    // --- Estado 6: Fondo 6 y animación específica (scroll left y tamaño) ---
    image(fondo6, 0, 0, 640, 480);

    // Animar la posición X incrementalmente (velocidad negativa para scroll left)
    if (despXTexto6 > 50) { // Parar la animación cuando alcance 50
       despXTexto6 = despXTexto6 + velocidadDespXTexto6;
    }

    // Animar el tamaño incrementalmente
    if (tamFont6 < 30) { // Parar cuando alcance 30
       tamFont6 = tamFont6 + velocidadTamFont6;
    }

    fill(255);
    textSize(tamFont6);
    text("Años después surgen nuevas amenazas alienígenas \n los Maestros de la Robotech \n vinculados a la fuente de la tecnología ", despXTexto6, 150); // Posición Y fija

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado6) {
      estadoActual = 7;
      tiempoInicioEstado = millis(); // Resetear el tiempo
      // Reinicializar variables para el ESTADO 7 al hacer la transición
      despYTexto7 = height; // Empieza abajo
      colorTexto7 = 0;      // Empieza oscuro
    }

  } else if (estadoActual == 7) {
    // --- Estado 7: Fondo 7 y animación específica (scroll up lento y color) ---
    image(fondo7, 0, 0, 640, 480);

    // Animar la posición Y incrementalmente (velocidad negativa)
    if (despYTexto7 > 180) { // Parar cuando alcance 180
       despYTexto7 = despYTexto7 + velocidadDespYTexto7;
    }

    // Animar el color incrementalmente
    if (colorTexto7 < 200) { // Parar cuando alcance 200 (un gris claro)
      colorTexto7 = colorTexto7 + velocidadColorTexto7;
    }

    fill(colorTexto7);
    textSize(25);
    text("Luego los Invid invaden y ocupan la Tierra \n atraídos por la Flor de la Vida\n otra manifestación de la Protocultura", 80, despYTexto7); // Posición X fija

    // Verificar si es hora de pasar al siguiente estado usando el tiempo
    if (tiempoTranscurrido > duracionEstado7) {
      estadoActual = 8;
      tiempoInicioEstado = millis(); // Resetear el tiempo
      // Reinicializar variables para el ESTADO 8 al hacer la transición
      alfaTexto8 = 0; // Empieza transparente
      // despYTexto8 no necesita reinicializarse si es una posición fija
    }

  } else if (estadoActual == 8) {
    // --- Estado 8: Fondo 8 y animación específica (solo fundido) ---
    image(fondo8, 0, 0, 640, 480);

    // Animar la transparencia incrementalmente
     if (alfaTexto8 < 255) { // Parar cuando alcance 255
      alfaTexto8 = alfaTexto8 + velocidadAlfaTexto8;
     }

    fill(255, 255, 255, alfaTexto8); // Usa alfa para el fundido
    textSize(30);
    text("La serie sigue a diferentes generaciones \n luchando por la supervivencia y la liberación de la Tierra\n a lo largo de estas tres grandes guerras interconectadas.", 100, despYTexto8); // Posición fija

    // Verificar si es hora de terminar o hacer algo más (este es el último estado definido)
    if (tiempoTranscurrido > duracionEstado8) {
        // El sketch simplemente seguirá dibujando el último fondo y texto en su estado final de animación.
        // Si necesitas hacer algo específico al final (como volver a empezar, mostrar un mensaje final, etc.)
        // podrías añadir un estado 9 aquí y definir su lógica.
        // Por ahora, se queda mostrando el último frame.
    }
  }
  // Si hubiera más estados, continuarías con más 'else if (estadoActual == X) { ... }'

  // Opcional: Imprimir información para depuración
  // println("Estado: " + estadoActual + ", Tiempo Transcurrido: " + tiempoTranscurrido);
}
