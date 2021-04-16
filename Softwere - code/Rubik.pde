import processing.serial.*;

import processing.video.*;

Capture cam;
PImage image;

final int rectTop=90;
final int rectLeft=140;
final int rectH=330;
final int rectW=330;
char[][][] tiles=new char[6][3][3];
char[][][] tiles2=new char[6][3][3];
Stanja stanje=Stanja.Sken0;
Kocka kocka;
int face, row, col;
boolean scanning=false;

void setup() {

  size(640, 480);
  ArduinoInterfejs.Init(this);
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
   println("Available cameras:");
   for (int i = 0; i < cameras.length; i++) {
   println(i+":"+cameras[i]);
   }
  }
  // The camera can be initialized directly using an 
  // element from the array returned by list():
  cam = new Capture(this, cameras[18]);
  cam.start();     
  println("PORTS:");
  for (int i = 0; i < Serial.list().length; i++) {
    println(i+":"+Serial.list()[i]);
  }
  //ArduinoInterfejs.Scan(20);
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    fill(0, 0, 0, 0);
    set(0, 0, cam);
    stroke(0);
    strokeWeight(5);
    rect(rectLeft, rectTop, rectH, rectW);
    TypedColorOverlay();
    
  }
  if (ArduinoInterfejs.completed && !scanning) switch(stanje) {
  case Sken0:
    face=0;
    row=0;
    col=0;
    scanning=true;
    ArduinoInterfejs.Scan(20);
    stanje=Stanja.Sken1; 
    break;
  case Sken1:
    face=1;
    row=0;
    col=0; 
    scanning=true;
    ArduinoInterfejs.Scan(21); 
    stanje=Stanja.Sken2; 
    break;
  case Sken2:
    face=2;
    row=0;
    col=0; 
    scanning=true;
    ArduinoInterfejs.Scan(22); 
    stanje=Stanja.Sken3; 
    break;
  case Sken3:
    face=3;
    row=0;
    col=0; 
    scanning=true;
    ArduinoInterfejs.Scan(23); 
    stanje=Stanja.Sken4; 
    break;
  case Sken4:
    face=4;
    row=0;
    col=0; 
    scanning=true;
    ArduinoInterfejs.Scan(24); 
    stanje=Stanja.Sken5; 
    break;
  case Sken5: 
    face=5;
    row=0;
    col=0;
    scanning=true;
    ArduinoInterfejs.Scan(25); 
    stanje=Stanja.Sken6; 
    break;
  case Sken6:  
    ArduinoInterfejs.Scan(26); 
    stanje=Stanja.Resavanje; 
    kocka=new Kocka(tiles); 
    kocka.ResiDoKraja();
    PrintKocka();
    print(Solution.Print());
    break;
  case Resavanje:
    if (Solution.PlayNext()) stanje=Stanja.Sken0; 
    break;
  }
}

char GetTileColor(PImage tile) {
  float Hue=hue(tile.get(tile.height/2, tile.width/2))+hue(tile.get(tile.height/2, tile.width/2+1))+hue(tile.get(tile.height/2, tile.width/2-1));
  float Sat=saturation(tile.get(tile.height/2, tile.width/2))+saturation(tile.get(tile.height/2, tile.width/2+1))+saturation(tile.get(tile.height/2, tile.width/2-1));
  float Brg=brightness(tile.get(tile.height/2, tile.width/2))+brightness(tile.get(tile.height/2, tile.width/2+1))+brightness(tile.get(tile.height/2, tile.width/2-1));
  Hue/=3;
  Sat/=3;
  Brg/=3;
  if (Brg>200 && Sat==0 && Hue==0) return 'W';
  if (Brg<150 && Sat<150) return 'Y';
  if (Hue<5 || Hue>200) return 'R';
  if (Hue<50) return 'O';
  if (Hue<133) return 'G';
  if (Hue<180 && Hue>137) return 'B';
  return (char)random(255);
}


char GetAndOverlayColor(int x, int y, int w, int h) {
  char col=GetTileColor(cam.get(x, y, w, h));
  switch(col) {
  case 'W': 
    fill(255, 255, 255, 100);       
    break;
  case 'R': 
    fill(255, 0, 0, 100);   
    break;
  case 'O': 
    fill(255, 127, 0, 100); 
    break;
  case 'Y': 
    fill(255, 255, 0, 100); 
    break;
  case 'G': 
    fill(0, 255, 0, 100);   
    break;
  case 'B': 
    fill(0, 0, 255, 100);   
    break;
  }
  textSize(w);
  text(col, x, y+h);
  //rect(x, y, w, h);
  return col;
}




void serialEvent(Serial serial) {
  while (serial.available()>0) {
    int in=serial.read();
    print(in);
    if (in==48) ArduinoInterfejs.Complete();
  }
}


boolean ScanSide(int i) {
  delay(100);
  while(cam.available()) cam.read();
  set(0, 0, cam);
  stroke(255, 0, 0);
  strokeWeight(1);
  tiles[i][0][0]=GetAndOverlayColor(rectLeft, rectTop, rectH/3, rectW/3);
  tiles[i][1][0]=GetAndOverlayColor(rectLeft, rectTop+rectH/3, rectH/3, rectW/3);
  tiles[i][2][0]=GetAndOverlayColor(rectLeft, rectTop+rectH*2/3, rectH/3, rectW/3);
  tiles[i][0][1]=GetAndOverlayColor(rectLeft+rectW/3, rectTop, rectH/3, rectW/3);
  tiles[i][1][1]=GetAndOverlayColor(rectLeft+rectW/3, rectTop+rectH/3, rectH/3, rectW/3);
  tiles[i][2][1]=GetAndOverlayColor(rectLeft+rectW/3, rectTop+rectH*2/3, rectH/3, rectW/3);
  tiles[i][0][2]=GetAndOverlayColor(rectLeft+rectW*2/3, rectTop, rectH/3, rectW/3);
  tiles[i][1][2]=GetAndOverlayColor(rectLeft+rectW*2/3, rectTop+rectH/3, rectH/3, rectW/3);
  tiles[i][2][2]=GetAndOverlayColor(rectLeft+rectW*2/3, rectTop+rectH*2/3, rectH/3, rectW/3);
  while (!cam.available()) delay(1);
  cam.read();
  tiles2[i][0][0]=GetAndOverlayColor(rectLeft, rectTop, rectH/3, rectW/3);
  tiles2[i][1][0]=GetAndOverlayColor(rectLeft, rectTop+rectH/3, rectH/3, rectW/3);
  tiles2[i][2][0]=GetAndOverlayColor(rectLeft, rectTop+rectH*2/3, rectH/3, rectW/3);
  tiles2[i][0][1]=GetAndOverlayColor(rectLeft+rectW/3, rectTop, rectH/3, rectW/3);
  tiles2[i][1][1]=GetAndOverlayColor(rectLeft+rectW/3, rectTop+rectH/3, rectH/3, rectW/3);
  tiles2[i][2][1]=GetAndOverlayColor(rectLeft+rectW/3, rectTop+rectH*2/3, rectH/3, rectW/3);
  tiles2[i][0][2]=GetAndOverlayColor(rectLeft+rectW*2/3, rectTop, rectH/3, rectW/3);
  tiles2[i][1][2]=GetAndOverlayColor(rectLeft+rectW*2/3, rectTop+rectH/3, rectH/3, rectW/3);
  tiles2[i][2][2]=GetAndOverlayColor(rectLeft+rectW*2/3, rectTop+rectH*2/3, rectH/3, rectW/3);
  for (int k=0; k<3; k++) for (int j=0; j<3; j++) if (tiles[i][j][k]!=tiles2[i][j][k]) return false;
  return true;
}

void ColorOverlay() {
  stroke(255, 0, 0);
  strokeWeight(1);
  GetAndOverlayColor(rectLeft, rectTop, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft, rectTop+rectH/3, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft, rectTop+rectH*2/3, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft+rectW/3, rectTop, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft+rectW/3, rectTop+rectH/3, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft+rectW/3, rectTop+rectH*2/3, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft+rectW*2/3, rectTop, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft+rectW*2/3, rectTop+rectH/3, rectH/3, rectW/3);
  GetAndOverlayColor(rectLeft+rectW*2/3, rectTop+rectH*2/3, rectH/3, rectW/3);
}

void OverlayTypedColor(int x,int y){
  char col=tiles[face][x][y];
  switch(col) {
  case 'W': 
    fill(255, 255, 255, 100);       
    break;
  case 'R': 
    fill(255, 0, 0, 100);   
    break;
  case 'O': 
    fill(255, 127, 0, 100); 
    break;
  case 'Y': 
    fill(255, 255, 0, 100); 
    break;
  case 'G': 
    fill(0, 255, 0, 100);   
    break;
  case 'B': 
    fill(0, 0, 255, 100);   
    break;
  default: fill(255,255,255,0);
  break;
  }
  rect(rectLeft+y*rectW/3, rectTop+x*rectH/3, rectW/3, rectH/3);
}

void TypedColorOverlay(){
  OverlayTypedColor(0,0);
  OverlayTypedColor(0,1);
  OverlayTypedColor(0,2);
  OverlayTypedColor(1,0);
  OverlayTypedColor(1,1);
  OverlayTypedColor(1,2);
  OverlayTypedColor(2,0);
  OverlayTypedColor(2,1);
  OverlayTypedColor(2,2);
}


void mousePressed() {
  println("Hue:"+hue(cam.get(mouseX, mouseY)));
  println("Sat:"+saturation(cam.get(mouseX, mouseY)));
  println("Brg:"+brightness(cam.get(mouseX, mouseY)));
}

void PrintKocka(){
  for(int i=0; i<6; i++){
    println("-------------");
  for(int j=0; j<3; j++)
  {
  for(int k=0; k<3; k++)
  print(tiles[i][j][k]);
  println();
  }  
}
}

void keyPressed() {
  if(key>'A' && key<'Z'); else return;
  if(key=='D') {col--; if(col<0) row--;  if(col<0) col=2; return;}
  if(key=='F') {scanning=false; return;}
  if(scanning){
    tiles[face][row][col]=key;
    row+=(col+1)/3;
    col=(col+1)%3;
  }
}