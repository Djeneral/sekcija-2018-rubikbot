static class ArduinoInterfejs{
  static Serial serial;
  private static boolean completed=true;
  public static void Init(PApplet parent){
    serial=new Serial(parent, Serial.list()[1], 9600);
  }
  public static void RotateFace(char face, int dir){
    completed=false;
    switch(face){
      case 'W': serial.write(8+dir); println(dir);     break;
      case 'R': serial.write(4+dir); println(2+dir); break;
      case 'O': serial.write(6+dir); println(4+dir); break;
      case 'Y': serial.write(10+dir); println(6+dir); break;
      case 'G': serial.write(dir); println(8+dir); break;
      default: serial.write(2+dir); println(10+dir); break;
    }
  }
  
  public static void Scan(int face){
    completed=false;
    serial.write(face);
    println("Scan"+face);
  }
  
  public static void Complete(){
    completed=true;
    println("Complete");
  }
}