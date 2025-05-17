PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
PImage fondo6;
PImage fondo7;
PImage fondo8;
int estadoActual; 

long tiempoInicioEstado; 
long duracionEstado1 = 6000; 
long duracionEstado2 = 6000; 
long duracionEstado3 = 6000; 
long duracionEstado4 = 6000; 
long duracionEstado5 = 8000; 
long duracionEstado6 = 9000; 
long duracionEstado7 = 8000; 
long duracionEstado8 = 12000; 

float tamFont1;
float velocidadTamFont1 = 0.1;

float despXTexto2;
float velocidadDespXTexto2 = 0.1;

float despYTexto3;
float velocidadDespYTexto3 = 0.5;

float despYTexto4;
float velocidadDespYTexto4 = -0.8;

float despYTexto5;
float velocidadDespYTexto5 = -0.8;
float alfaTexto5;
float velocidadAlfaTexto5 = 2;

float despXTexto6;
float velocidadDespXTexto6 = -1.5;
float tamFont6;
float velocidadTamFont6 = 0.05;

float despYTexto7;
float velocidadDespYTexto7 = -0.5;

float alfaTexto8;
float velocidadAlfaTexto8 = 1.5;
float despYTexto8;

float botonX;
float botonY;
float botonAncho = 150; 
float botonAlto = 40; 

void setup() {
  size(640, 480);
  fondo1 = loadImage("data/fondo1.jpg");
  fondo2 = loadImage("data/fondo2.jpg");
  fondo3 = loadImage("data/fondo3.jpg");
  fondo4 = loadImage("data/fondo4.jpg");
  fondo5 = loadImage("data/fondo5.jpg");
  fondo6 = loadImage("data/fondo6.jpg");
  fondo7 = loadImage("data/fondo7.jpg");
  fondo8 = loadImage("data/fondo8.jpg");

  botonX = width - botonAncho - 20;
  botonY = height - botonAlto - 20;
  reiniciarAnimacion();
}
 void reiniciarAnimacion() {
  estadoActual = 1; 
  tiempoInicioEstado = millis(); 
  tamFont1 = 1;
  despXTexto2 = 1;
  despYTexto3 = 1;
  despYTexto4 = height;
  despYTexto5 = height + 50;
  alfaTexto5 = 0;
  despXTexto6 = width + 100;
  tamFont6 = 10;
  despYTexto7 = height;
  alfaTexto8 = 0;
  despYTexto8 = 200; 
}
void draw() {
  long tiempoTranscurrido = millis() - tiempoInicioEstado;

  if (estadoActual == 1) {
    image(fondo1, 0, 0, 640, 480);
    if (tamFont1 < 30) {
      tamFont1 = tamFont1 + velocidadTamFont1;
    }
    fill(218);
    textSize(tamFont1);
    text("Robotech\n es una serie animada de 1985\n creada por Carl Macek \n fusionando y adaptando \ntres series de animación japonesa", 100, 125);

    if (tiempoTranscurrido > duracionEstado1) {
      estadoActual = 2;
      tiempoInicioEstado = millis(); 
    }
  } else if (estadoActual == 2) {
    image(fondo2, 0, 0, 640, 480);

    if (despXTexto2 < 30) {
      despXTexto2 = despXTexto2 + velocidadDespXTexto2;
    }
    fill(218);
    textSize(25);
    text("Narra la historia de la humanidad\n a lo largo de varias décadas \n comenzando con el descubrimiento\n de una avanzada tecnología alienígena \n la Robotecnología \n a partir de una nave espacial estrellada.", despXTexto2, 100);

    if (tiempoTranscurrido > duracionEstado2) {
      estadoActual = 3;
      tiempoInicioEstado = millis();
      despYTexto3 = 1;
    }
  } else if (estadoActual == 3) {
    image(fondo3, 0, 0, 640, 480);
     if (despYTexto3 < 200) {
       despYTexto3 = despYTexto3 + velocidadDespYTexto3;
     }
    fill(218);
    textSize(25);
    text("Esta saga inicial establece el tono \n siguiendo a personajes clave \n como pilotos y oficiales \n mientras luchan por sobrevivir", 50, despYTexto3);

    if (tiempoTranscurrido > duracionEstado3) {
      estadoActual = 4;
      tiempoInicioEstado = millis();
      despYTexto4 = height;
    }
  } else if (estadoActual == 4) {
    image(fondo4, 0, 0, 640, 480);

    if (despYTexto4 > 100) {
       despYTexto4 = despYTexto4 + velocidadDespYTexto4;
    }
    fill(218);
    textSize(25);
    text("Descubren que los Zentradi \n son guerreros clonados gigantes\n sin entender emociones ni cultura \n lo que los hace vulnerables", 100, despYTexto4);

    if (tiempoTranscurrido > duracionEstado4) {
      estadoActual = 5;
      tiempoInicioEstado = millis(); 
      despYTexto5 = height + 50;
      alfaTexto5 = 0;
    }
  } else if (estadoActual == 5) {
    image(fondo5, 0, 0, 640, 480);

    if (despYTexto5 > 100) {
       despYTexto5 = despYTexto5 + velocidadDespYTexto5;
    }

    if (alfaTexto5 < 255) {
      alfaTexto5 = alfaTexto5 + velocidadAlfaTexto5;
    }
    fill(255); 
    textSize(28);
    text("Esta primera gran guerra \n culmina en una batalla \n apocalíptica que redibuja el planeta \n y mezcla humanos y Zentradi", 100, despYTexto5);

    if (tiempoTranscurrido > duracionEstado5) {
      estadoActual = 6;
      tiempoInicioEstado = millis(); 
      despXTexto6 = width + 100;
      tamFont6 = 10;
    }
  } else if (estadoActual == 6) {
    image(fondo6, 0, 0, 640, 480);

    if (despXTexto6 > 50) {
       despXTexto6 = despXTexto6 + velocidadDespXTexto6;
    }

    if (tamFont6 < 30) {
       tamFont6 = tamFont6 + velocidadTamFont6;
    }
    fill(0);
    textSize(tamFont6);
    text("Años después \n surgen nuevas amenazas alienígenas \n los Maestros de la Robotech \n vinculados a la fuente de la tecnología ", despXTexto6, 150);

    if (tiempoTranscurrido > duracionEstado6) {
      estadoActual = 7;
      tiempoInicioEstado = millis(); 
      despYTexto7 = height;
    }
  } else if (estadoActual == 7) {
    image(fondo7, 0, 0, 640, 480);

    if (despYTexto7 > 180) {
       despYTexto7 = despYTexto7 + velocidadDespYTexto7;  
    fill(255);
    textSize(25);
    text("Luego los Invid invaden y ocupan la Tierra \n atraídos por la Flor de la Vida\n otra manifestación de la Protocultura", 80, despYTexto7); 
    }
    if (tiempoTranscurrido > duracionEstado7) {
      estadoActual = 8;
      tiempoInicioEstado = millis(); 
      alfaTexto8 = 0;
    }
  } else if (estadoActual == 8) {
    image(fondo8, 0, 0, 640, 480);

     if (alfaTexto8 < 255) {
      alfaTexto8 = alfaTexto8 + velocidadAlfaTexto8;
     }
    fill(255, 255, 255, alfaTexto8);
    textSize(30);
    text("La serie \n sigue a diferentes generaciones \n luchando por la supervivencia \n y la liberación de la Tierra\n a lo largo de estas tres grandes guerras interconectadas.", 100, despYTexto8); 

    if (tiempoTranscurrido > duracionEstado8) {
    }

    if (mouseX > botonX && mouseX < botonX + botonAncho && mouseY > botonY && mouseY < botonY + botonAlto) {
        fill(150, 200, 250); 
    } else {
        fill(100, 150, 200); 
    }
    rect(botonX, botonY, botonAncho, botonAlto, 7);

    fill(255);
    textSize(18); 
    textAlign(CENTER, CENTER); 
    text("Reiniciar", botonX + botonAncho/2, botonY + botonAlto/2);
    textAlign(LEFT, BASELINE); 
  }
}
void mousePressed() {
  if (estadoActual == 8) {
    if (mouseX > botonX && mouseX < botonX + botonAncho && mouseY > botonY && mouseY < botonY + botonAlto) {
      println("Botón Reiniciar clicado. Reiniciando animación."); 
      reiniciarAnimacion(); 
    }
  }
}
