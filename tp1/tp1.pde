PImage miImagen;
void setup(){
  size(800, 400);
  miImagen = loadImage("cristo.jpg");
}
  void draw(){
  background(84, 117, 198);
  image(miImagen, 0, 0, 400, 400);
  
   // --- Pedestal ---
  fill(0);
  noStroke();
  rect(500, 380, 180, 40); 

  // --- Estatua ---
  
  // torso
  fill(205);
  rect(550, 160, 72, 220);
  stroke(140);
  line(550, 278, 623, 320);
  stroke(140);
  line(560, 284, 560, 379);
  stroke(140);
  line(570, 289, 570, 379);
  stroke(140);
  line(580, 294, 580, 379);
  stroke(140);
  line(590, 299, 590, 379);
  stroke(140);
  line(600, 304, 600, 379);
  stroke(140);
  line(610, 309, 610, 379);
  
  // manto 
  noStroke();
    fill(205);
  rect(490, 140, 190, 40);
  triangle(680, 140, 705, 140, 679, 180);
  triangle(490, 140, 464, 140, 490, 178);
  triangle(550, 180, 485, 179, 550, 183);
  triangle(620, 179, 683, 179, 622, 183);
  triangle(550, 180, 538, 250, 550, 250);
  triangle(622, 195, 627, 326, 620, 315);
  
  //sombra
  fill(145);
  ellipse(521, 182, 57, 4);
  ellipse(650, 182, 57, 4);
  ellipse(545, 249, 14, 6);
  
  //agregado manto
  fill(205);
  triangle(625, 267, 633, 294, 624, 294);
  fill(160);
  ellipse(629, 294, 8, 5);
  stroke(140);
  
  //detalles manga izq
  line(522, 139, 562, 172);
  line(507, 142, 546, 172);
  line(490, 145, 530, 178);
  
  //detalles manga der
  line(661, 144, 626, 175);
  line(676, 150,  645, 178);
  
  //detalles centro manto
  ellipse(575, 170, 28, 1);
  ellipse(562, 215, 1, 90);
  line(562, 260, 550, 269);
  ellipse(614, 227, 1, 130);
  line(600, 288, 626, 296);
  
  
  //manos
  fill(210);
  //izquierda
  stroke(170);
    ellipse(453, 142, 23, 5);
  noStroke();
    ellipse(454, 150, 49, 13);

  //derecha
  stroke(170);
  ellipse(718, 142, 23, 5);
  noStroke();
  ellipse(715, 150, 49, 13);

  // Cabeza
  ellipse(585, 95, 47, 70); //
  fill(200);
  rect(560, 80, 10, 63, 8);
  triangle(579, 58, 560, 82, 572, 80);
  rect(601, 80, 10, 63, 8);
  triangle(595, 58, 612, 84, 599, 75); 
  rect(574, 60, 23, 10, 8);
  fill(210);
  rect(571, 125, 29, 17);
  
  //detalles cara
  fill(198);
   ellipse(585, 115, 18, 3);
   fill(190);
   ellipse(577, 85, 13, 4);
   ellipse(593, 85, 13, 4);
   triangle(584, 90, 581, 108, 587, 108);
   

 /*fill(1);
  textSize(40);
  text(mouseX + " - " + mouseY, mouseX, mouseY);
  println(mouseX + " - " + mouseY); */
}
