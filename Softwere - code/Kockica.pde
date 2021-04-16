enum Type {
  corner, edge;
}
class Kockica {
  Type type;
  char facelets[];
  char position[];
  Kockica(Type type, char[] facelets, char[] position) {
    this.type=type;
    this.facelets=facelets;
    this.position=position;
  }

  public char GetClockwiseFace(char top, char front) {
    if (top=='W')switch(front) {
    case 'B': 
      return 'R';
    case 'R': 
      return 'G';
    case 'G': 
      return 'O';
    case 'O': 
      return 'B';
    }

    if (top=='Y')switch(front) {
    case 'R': 
      return 'B';
    case 'G': 
      return 'R';
    case 'O': 
      return 'G';
    case 'B': 
      return 'O';
    }

    if (top=='R')switch(front) {
    case 'W': 
      return 'B';
    case 'B': 
      return 'Y';
    case 'Y': 
      return 'G';
    case 'G': 
      return 'W';
    }

    if (top=='O')switch(front) {
    case 'W': 
      return 'G';
    case 'G': 
      return 'Y';
    case 'Y': 
      return 'B';
    case 'B': 
      return 'W';
    }

    if (top=='G')switch(front) {
    case 'W': 
      return 'R';
    case 'R': 
      return 'Y';
    case 'Y': 
      return 'O';
    case 'O': 
      return 'W';
    }

    if (top=='B')switch(front) {
    case 'W': 
      return 'O';
    case 'O': 
      return 'Y';
    case 'Y': 
      return 'R';
    case 'R': 
      return 'W';
    }
    return 'W';
  }

  public char GetCounterClockwiseFace(char top, char front) {
    return GetClockwiseFace(top, GetClockwiseFace(top, GetClockwiseFace(top, front)));
  }

  void TurnClockwise(char face) {
    if (face==position[0]) {
      position[1]=GetClockwiseFace(face, position[1]);
      if (type==Type.corner)position[2]=GetClockwiseFace(face, position[2]);
      return;
    }
    if (face==position[1]) {
      position[0]=GetClockwiseFace(face, position[0]);
      if (type==Type.corner)position[2]=GetClockwiseFace(face, position[2]);
      return;
    }
    if (type!=Type.corner) return;
    if (face!=position[2]) return;
    position[0]=GetClockwiseFace(face, position[0]);
    position[1]=GetClockwiseFace(face, position[1]);
  }

  void TurnCounterClockwise(char face) {
    if (face==position[0]) {
      position[1]=GetCounterClockwiseFace(face, position[1]);
      if (type==Type.corner)position[2]=GetCounterClockwiseFace(face, position[2]);
      return;
    }
    if (face==position[1]) {
      position[0]=GetCounterClockwiseFace(face, position[0]);
      if (type==Type.corner)position[2]=GetCounterClockwiseFace(face, position[2]);
      return;
    }
    if (type!=Type.corner) return;
    if (face!=position[2]) return;
    position[0]=GetCounterClockwiseFace(face, position[0]);
    position[1]=GetCounterClockwiseFace(face, position[1]);
  }

  boolean Is(char facelets[]) {
    if (facelets.length!=this.facelets.length) return false;
    for (int i=0; i<facelets.length; i++) {
      boolean found=false;
      for (int j=0; j<facelets.length; j++)
        if (this.facelets[i]==facelets[j]) found=true;
      if (!found) return false;
    }
    return true;
  }

  boolean IsAligned() {
    if (facelets[0]!=position[0]) return false;
    if (facelets[1]!=position[1]) return false;
    if (type==Type.edge) return true;
    if (facelets[2]==position[2]) return true;
    return false;
  }

  boolean InPosition(char position[]) {
    if (position.length!=this.position.length) return false;
    for (int i=0; i<position.length; i++) {
      boolean found=false;
      for (int j=0; j<position.length; j++)
        if (this.position[i]==position[j]) found=true;
      if (!found) return false;
    }
    return true;
  }

  boolean IsOnFace(char face) {
    for (int i=0; i<position.length; i++) if (position[i]==face) return true;
    return false;
  }
  char GetAlignedFace(){
    for (int i=0; i<position.length; i++) if(facelets[i]==position[i]) return facelets[i];
    return 'N';
  }
   boolean OrangeAligned(){
     for (int i=0; i<position.length; i++) if(facelets[i]==position[i] && position[i]=='O') return true;
     return false;
   }
  
}