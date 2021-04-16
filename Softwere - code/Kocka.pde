enum Faza {
  krst1, krst2, krst3, krst4, cose1, cose2, cose3, cose4, sredina1, sredina2, sredina3, sredina4, tacka, vinkla, lajsna, krst, coskici, coskici2;
}
class Kocka {
  Kockica kockice[]=new Kockica[20];
  Faza faza=Faza.krst1;
  char finalFront='N';
  Kocka(char tiles[][][]) {
    //WRYOBG
    kockice[0] =new Kockica(Type.edge, new char[] {tiles[0][0][1], tiles[1][2][1]}, new char[] {'W', 'R'});
    kockice[1] =new Kockica(Type.edge, new char[] {tiles[0][1][2], tiles[5][1][0]}, new char[] {'W', 'G'});
    kockice[2] =new Kockica(Type.edge, new char[] {tiles[0][1][0], tiles[4][1][2]}, new char[] {'W', 'B'});
    kockice[3] =new Kockica(Type.edge, new char[] {tiles[0][2][1], tiles[3][0][1]}, new char[] {'W', 'O'});
    kockice[4] =new Kockica(Type.edge, new char[] {tiles[1][0][1], tiles[2][2][1]}, new char[] {'R', 'Y'});
    kockice[5] =new Kockica(Type.edge, new char[] {tiles[1][1][2], tiles[5][0][1]}, new char[] {'R', 'G'});
    kockice[6] =new Kockica(Type.edge, new char[] {tiles[1][1][0], tiles[4][0][1]}, new char[] {'R', 'B'});
    kockice[7] =new Kockica(Type.edge, new char[] {tiles[2][0][1], tiles[3][2][1]}, new char[] {'Y', 'O'});
    kockice[8] =new Kockica(Type.edge, new char[] {tiles[2][1][2], tiles[5][1][2]}, new char[] {'Y', 'G'});
    kockice[9] =new Kockica(Type.edge, new char[] {tiles[2][1][0], tiles[4][1][0]}, new char[] {'Y', 'B'});
    kockice[10]=new Kockica(Type.edge, new char[] {tiles[3][1][2], tiles[5][2][1]}, new char[] {'O', 'G'});
    kockice[11]=new Kockica(Type.edge, new char[] {tiles[3][1][0], tiles[4][2][1]}, new char[] {'O', 'B'});
    kockice[12]=new Kockica(Type.corner, new char[] {tiles[0][0][0], tiles[1][2][0], tiles[4][0][2]}, new char[] {'W', 'R', 'B'});
    kockice[13]=new Kockica(Type.corner, new char[] {tiles[0][0][2], tiles[1][2][2], tiles[5][0][0]}, new char[] {'W', 'R', 'G'});
    kockice[14]=new Kockica(Type.corner, new char[] {tiles[0][2][0], tiles[3][0][0], tiles[4][2][2]}, new char[] {'W', 'O', 'B'});
    kockice[15]=new Kockica(Type.corner, new char[] {tiles[0][2][2], tiles[3][0][2], tiles[5][2][0]}, new char[] {'W', 'O', 'G'});
    kockice[16]=new Kockica(Type.corner, new char[] {tiles[2][0][0], tiles[3][2][0], tiles[4][2][0]}, new char[] {'Y', 'O', 'B'});
    kockice[17]=new Kockica(Type.corner, new char[] {tiles[2][0][2], tiles[3][2][2], tiles[5][2][2]}, new char[] {'Y', 'O', 'G'});
    kockice[18]=new Kockica(Type.corner, new char[] {tiles[2][2][0], tiles[1][0][0], tiles[4][0][0]}, new char[] {'Y', 'R', 'B'});
    kockice[19]=new Kockica(Type.corner, new char[] {tiles[2][2][2], tiles[1][0][2], tiles[5][0][2]}, new char[] {'Y', 'R', 'G'});
  }

  Kockica Find(char kockica[]) {
    for (int i=0; i<20; i++) if (kockice[i].Is(kockica)) return kockice[i];
    return null;
  }

  boolean Resi() {
    Kockica kockica;
    switch(faza) {
    case krst1:
      kockica=Find(new char[] {'R', 'W'});
      if (kockica.InPosition(new char[] {'R', 'W'}) && kockica.IsAligned()) {
        faza=Faza.krst2; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W'}) && !kockica.IsAligned()) { 
        TurnClockwise('W'); 
        TurnCounterClockwise('G'); 
        TurnCounterClockwise('O'); 
        return false;
      }
      if (kockica.IsOnFace('R')) {
        TurnClockwise('R');
        return false;
      }
      if (kockica.IsOnFace('W')) {
        TurnClockwise('W'); 
        return false ;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O'); 
        return false;
      }
      if (kockica.IsOnFace('Y')) {
        TurnClockwise('Y'); 
        return false;
      }

      break;

    case krst2:
      kockica=Find(new char[] {'R', 'G'});
      if (kockica.InPosition(new char[] {'R', 'G'}) && kockica.IsAligned()) {
        faza=Faza.krst3; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'G'}) && !kockica.IsAligned()) { 
        TurnClockwise('G'); 
        TurnCounterClockwise('Y'); 
        TurnCounterClockwise('O'); 
        return false;
      }
      if (kockica.IsOnFace('G')) {
        TurnClockwise('G'); 
        return false ;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O'); 
        return false;
      }
      if (kockica.IsOnFace('B')) {
        TurnClockwise('B'); 
        return false;
      }
      if (kockica.IsOnFace('Y')) {
        TurnCounterClockwise('Y');
        return false;
      }
      break;

    case krst3:
      kockica=Find(new char[] {'R', 'Y'});
      if (kockica.InPosition(new char[] {'R', 'Y'}) && kockica.IsAligned()) {
        faza=Faza.krst4; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y'}) && !kockica.IsAligned()) { 
        TurnClockwise('Y'); 
        TurnCounterClockwise('B'); 
        TurnCounterClockwise('O'); 
        return false;
      }
      if (kockica.IsOnFace('Y')) {
        TurnClockwise('Y'); 
        return false ;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O'); 
        return false;
      }
      if (kockica.IsOnFace('B')) {
        TurnCounterClockwise('B');
        return false;
      }
      if (kockica.IsOnFace('W')) {
        TurnClockwise('W');
        TurnCounterClockwise('O');
        TurnCounterClockwise('W');
        return false;
      }

      break;

    case krst4:
      kockica=Find(new char[] {'R', 'B'});
      if (kockica.InPosition(new char[] {'R', 'B'}) && kockica.IsAligned()) {
        faza=Faza.cose1; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'B'}) && !kockica.IsAligned()) { 
        TurnClockwise('B'); 
        TurnCounterClockwise('W'); 
        TurnCounterClockwise('O');
        TurnClockwise('W');
        return false;
      }
      if (kockica.IsOnFace('B')) {
        TurnClockwise('B'); 
        return false ;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O'); 
        return false;
      }
      if (kockica.InPosition(new char[] {'G', 'W'})) {
        TurnCounterClockwise('G');
        TurnCounterClockwise('O');
        TurnClockwise('G');
        return false;
      }
      if (kockica.IsOnFace('G')) {
        TurnClockwise('G');
        TurnCounterClockwise('O');
        TurnCounterClockwise('G');
        return false;
      }

      break;

    case cose1:
      kockica=Find(new char[] {'R', 'B', 'W'});
      if (kockica.InPosition(new char[] {'R', 'B', 'W'}) && kockica.IsAligned()) {
        faza=Faza.cose2; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'B', 'W'}) && !kockica.IsAligned()) { 
        TurnCounterClockwise('W'); 
        TurnCounterClockwise('O'); 
        TurnClockwise('W');
        return false;
      }
      if (kockica.InPosition(new char[] {'O', 'B', 'W'})) {
        TurnCounterClockwise('W');
        TurnCounterClockwise('O');
        TurnClockwise('W');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W', 'G'})) {
        TurnCounterClockwise('G');
        TurnCounterClockwise('O');
        TurnClockwise('G');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y', 'G'})) {
        TurnCounterClockwise('Y');
        TurnCounterClockwise('O');
        TurnClockwise('Y');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y', 'B'})) {
        TurnCounterClockwise('B');
        TurnCounterClockwise('O');
        TurnClockwise('B');
        return false;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O');
        return false;
      }
      break;

    case cose2:
      kockica=Find(new char[] {'R', 'W', 'G'});
      if (kockica.InPosition(new char[] {'R', 'W', 'G'}) && kockica.IsAligned()) {
        faza=Faza.cose3; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W', 'G'}) && !kockica.IsAligned()) { 
        TurnCounterClockwise('G'); 
        TurnCounterClockwise('O'); 
        TurnClockwise('G');
        return false;
      }
      if (kockica.InPosition(new char[] {'O', 'W', 'G'})) {
        TurnCounterClockwise('G');
        TurnCounterClockwise('O');
        TurnClockwise('G');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W', 'B'})) {
        TurnCounterClockwise('W');
        TurnCounterClockwise('O');
        TurnClockwise('W');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y', 'G'})) {
        TurnCounterClockwise('Y');
        TurnCounterClockwise('O');
        TurnClockwise('Y');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y', 'B'})) {
        TurnCounterClockwise('B');
        TurnCounterClockwise('O');
        TurnClockwise('B');
        return false;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O');
        return false;
      }
      break;

    case cose3:
      kockica=Find(new char[] {'R', 'G', 'Y'});
      if (kockica.InPosition(new char[] {'R', 'G', 'Y'}) && kockica.IsAligned()) {
        faza=Faza.cose4; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'G', 'Y'}) && !kockica.IsAligned()) { 
        TurnCounterClockwise('Y'); 
        TurnCounterClockwise('O'); 
        TurnClockwise('Y');
        return false;
      }
      if (kockica.InPosition(new char[] {'O', 'G', 'Y'})) {
        TurnCounterClockwise('Y');
        TurnCounterClockwise('O');
        TurnClockwise('Y');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W', 'G'})) {
        TurnCounterClockwise('G');
        TurnCounterClockwise('O');
        TurnClockwise('G');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'B', 'W'})) {
        TurnCounterClockwise('W');
        TurnCounterClockwise('O');
        TurnClockwise('W');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y', 'B'})) {
        TurnCounterClockwise('B');
        TurnCounterClockwise('O');
        TurnClockwise('B');
        return false;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O');
        return false;
      }
      break;

    case cose4:
      kockica=Find(new char[] {'R', 'B', 'Y'});
      if (kockica.InPosition(new char[] {'R', 'B', 'Y'}) && kockica.IsAligned()) {
        faza=Faza.sredina1; 
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'B', 'Y'}) && !kockica.IsAligned()) { 
        TurnCounterClockwise('B'); 
        TurnCounterClockwise('O'); 
        TurnClockwise('B');
        return false;
      }
      if (kockica.InPosition(new char[] {'O', 'B', 'Y'})) {
        TurnCounterClockwise('B');
        TurnCounterClockwise('O');
        TurnClockwise('B');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W', 'G'})) {
        TurnCounterClockwise('G');
        TurnCounterClockwise('O');
        TurnClockwise('G');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'Y', 'G'})) {
        TurnCounterClockwise('Y');
        TurnCounterClockwise('O');
        TurnClockwise('Y');
        return false;
      }
      if (kockica.InPosition(new char[] {'R', 'W', 'B'})) {
        TurnCounterClockwise('W');
        TurnCounterClockwise('O');
        TurnClockwise('W');
        return false;
      }
      if (kockica.IsOnFace('O')) {
        TurnClockwise('O');
        return false;
      }
      break;

    case sredina1:
      if (SolveSredina('B', 'W')) faza=Faza.sredina2;
      return false;

    case sredina2:
      if (SolveSredina('W', 'G')) faza=Faza.sredina3;
      return false;

    case sredina3:
      if (SolveSredina('G', 'Y')) faza=Faza.sredina4;
      return false;

    case sredina4:
      if (SolveSredina('Y', 'B')) faza=Faza.tacka;
      return false;

    case tacka:
      if (CountAligned()==0) {
        Algorithm('G');
        return false;
      }
      if (CountAligned()>=2) {
        faza=Faza.vinkla;
        return false;
      }
      break;

    case vinkla:

      if (CountAligned()==4) {
        faza=Faza.krst;
        return false;
      }
      if (AtPosition(new char[]{'B', 'O'}).OrangeAligned() && AtPosition(new char[]{'W', 'O'}).OrangeAligned()) {
        Algorithm2('Y');
        return false;
      }
      if (AtPosition(new char[]{'G', 'O'}).OrangeAligned() && AtPosition(new char[]{'W', 'O'}).OrangeAligned()) {
        Algorithm2('B');
        return false;
      }
      if (AtPosition(new char[]{'G', 'O'}).OrangeAligned() && AtPosition(new char[]{'Y', 'O'}).OrangeAligned()) {
        Algorithm2('W');
        return false;
      }
      if (AtPosition(new char[]{'B', 'O'}).OrangeAligned() && AtPosition(new char[]{'Y', 'O'}).OrangeAligned()) {
        Algorithm2('G');
        return false;
      }
      faza=Faza.lajsna;
      return false;

    case lajsna:
      if (CountAligned()==4) {
        faza=Faza.krst;
        return false;
      }
      if (AtPosition(new char[]{'B', 'O'}).OrangeAligned() && AtPosition(new char[]{'G', 'O'}).OrangeAligned()) {
        Algorithm('Y');
        return false;
      }
      if (AtPosition(new char[]{'Y', 'O'}).OrangeAligned() && AtPosition(new char[]{'W', 'O'}).OrangeAligned()) {
        Algorithm('B');
        return false;
      }
      break;

    case krst:
      if (AtPosition(new char[]{'B', 'O'}).IsAligned() && AtPosition(new char[]{'W', 'O'}).IsAligned() && AtPosition(new char[]{'G', 'O'}).IsAligned() && AtPosition(new char[]{'Y', 'O'}).IsAligned()) {
        faza=Faza.coskici; 
        return false;
      }
      if (AtPosition(new char[]{'B', 'O'}).IsAligned() && AtPosition(new char[]{'W', 'O'}).IsAligned()) {
        Algorithm3('B');
        return false;
      }
      if (AtPosition(new char[]{'G', 'O'}).IsAligned() && AtPosition(new char[]{'W', 'O'}).IsAligned()) {
        Algorithm3('W');
        return false;
      }
      if (AtPosition(new char[]{'G', 'O'}).IsAligned() && AtPosition(new char[]{'Y', 'O'}).IsAligned()) {
        Algorithm3('G');
        return false;
      }
      if (AtPosition(new char[]{'B', 'O'}).IsAligned() && AtPosition(new char[]{'Y', 'O'}).IsAligned()) {
        Algorithm3('Y');
        return false;
      }
      if (AtPosition(new char[]{'B', 'O'}).IsAligned() && AtPosition(new char[]{'G', 'O'}).IsAligned()) {
        Algorithm3('Y');
        TurnClockwise('O');
        Algorithm3('G');
        return false;
      }
      if (AtPosition(new char[]{'Y', 'O'}).IsAligned() && AtPosition(new char[]{'W', 'O'}).IsAligned()) {
        Algorithm3('G');
        TurnClockwise('O');
        Algorithm3('W');
        return false;
      }
      TurnClockwise('O');
      return false;
    case coskici:
      if (AllInPosition()){faza=Faza.coskici2; return false;};
      println(FindWellPlaced());
      if (FindWellPlaced()=='N') {
        Algorithm4('W');
        return false;
      }
      Algorithm4(FindWellPlaced());
      return false;
      
    case coskici2:
    if(Solved()) return true;
    if(finalFront=='N'){
      finalFront=FindMisaligned();
      println(finalFront);
      return false;
    }
    if(FindMisaligned()=='N'){
      TurnClockwise('O');
      return false;
    }
    if(AtPosition(new char[]{'O', finalFront, kockice[0].GetCounterClockwiseFace('O', finalFront)}).OrangeAligned()){
      TurnClockwise('O');
      return false;
    }
    Algorithm5(finalFront);
    return false;
    
    default: 
      return false;
    }
    return false;
  }

  void ResiDoKraja() {
    while (!Resi());
    while (Solution.Optimize());
  }

  void TurnClockwise(char face) {
    for (int i=0; i<20; i++) kockice[i].TurnClockwise(face);
    Solution.AddStep(face, 0);
  }

  void TurnCounterClockwise(char face) {
    for (int i=0; i<20; i++) kockice[i].TurnCounterClockwise(face);
    Solution.AddStep(face, 1);
  }
  boolean SolveSredina(char first, char second) {
    Kockica kockica=Find(new char[]{first, second});
    if (kockica.InPosition(new char[]{first, second}) && kockica.IsAligned()) {
      return true;
    }
    if (kockica.InPosition(new char[]{'W', 'B'})) {
      TurnCounterClockwise('W');
      TurnClockwise('O');
      TurnClockwise('W');
      TurnClockwise('O');
      TurnClockwise('B');
      TurnCounterClockwise('O');
      TurnCounterClockwise('B');
      return false;
    }
    if (kockica.InPosition(new char[]{'W', 'G'})) {
      TurnCounterClockwise('G');
      TurnClockwise('O');
      TurnClockwise('G');
      TurnClockwise('O');
      TurnClockwise('W');
      TurnCounterClockwise('O');
      TurnCounterClockwise('W');
      return false;
    }
    if (kockica.InPosition(new char[]{'G', 'Y'})) {
      TurnCounterClockwise('Y');
      TurnClockwise('O');
      TurnClockwise('Y');
      TurnClockwise('O');
      TurnClockwise('G');
      TurnCounterClockwise('O');
      TurnCounterClockwise('G');
      return false;
    }
    if (kockica.InPosition(new char[]{'Y', 'B'})) {
      TurnCounterClockwise('B');
      TurnClockwise('O');
      TurnClockwise('B');
      TurnClockwise('O');
      TurnClockwise('Y');
      TurnCounterClockwise('O');
      TurnCounterClockwise('Y');
      return false;
    }
    if (kockica.GetAlignedFace()=='N') {
      TurnClockwise('O');
      return false;
    }
    if (kockica.GetAlignedFace()==first) {
      TurnCounterClockwise('O');
      TurnCounterClockwise(second);
      TurnClockwise('O');
      TurnClockwise(second);
      TurnClockwise('O');
      TurnClockwise(first);
      TurnCounterClockwise('O');
      TurnCounterClockwise(first);
      return false;
    }
    if (kockica.GetAlignedFace()==second) {
      TurnClockwise('O');
      TurnClockwise(first);
      TurnCounterClockwise('O');
      TurnCounterClockwise(first);
      TurnCounterClockwise('O');
      TurnCounterClockwise(second);
      TurnClockwise('O');
      TurnClockwise(second);
      return false;
    }
    return false;
  }

  void Algorithm(char front) {
    Kockica kockica=new Kockica(Type.edge, null, null);
    TurnClockwise(front);
    TurnClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnClockwise('O');
    TurnCounterClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnCounterClockwise('O');
    TurnCounterClockwise(front);
  }

  void Algorithm2(char front) {
    Kockica kockica=new Kockica(Type.edge, null, null);
    TurnClockwise(front);
    TurnClockwise('O');
    TurnClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnCounterClockwise('O');
    TurnCounterClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnCounterClockwise(front);
    println("algoritam");
  }

  int CountAligned() {
    int cnt=0;
    for (int i=0; i<12; i++) if (kockice[i].OrangeAligned()) cnt++;
    println(faza+" "+cnt);
    return cnt;
  }

  Kockica AtPosition(char position[]) {
    for (int i=0; i<20; i++) if (kockice[i].InPosition(position)) return kockice[i];
    return null;
  }

  void Algorithm3(char front) {
    Kockica kockica=new Kockica(Type.edge, null, null);
    TurnClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnClockwise('O');
    TurnCounterClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnClockwise('O');
    TurnClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnClockwise('O');
    TurnClockwise('O');
    TurnCounterClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnClockwise('O');
  }

  void Algorithm4(char front) {
    Kockica kockica=new Kockica(Type.edge, null, null);
    TurnClockwise('O');
    TurnClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnCounterClockwise('O');
    TurnCounterClockwise(kockica.GetClockwiseFace('O', front));
    TurnClockwise('O');
    TurnCounterClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnCounterClockwise('O');
    TurnClockwise(kockica.GetClockwiseFace('O', front));
  }

  char FindWellPlaced() {
    Kockica kockica=Find(new char[]{'W', 'O', 'B'});
    if (kockica.InPosition(new char[]{'W', 'O', 'B'})) return 'W';
    kockica=Find(new char[]{'Y', 'O', 'G'});
    if (kockica.InPosition(new char[]{'Y', 'O', 'G'})) return 'Y';
    kockica=Find(new char[]{'W', 'O', 'G'});
    if (kockica.InPosition(new char[]{'W', 'O', 'G'})) return 'G';
    kockica=Find(new char[]{'Y', 'O', 'B'});
    if (kockica.InPosition(new char[]{'Y', 'O', 'B'})) return 'B';
    return 'N';
  }

  boolean AllInPosition() {
    return Find(new char[]{'W', 'O', 'B'}).InPosition(new char[]{'W', 'O', 'B'}) && Find(new char[]{'Y', 'O', 'B'}).InPosition(new char[]{'Y', 'O', 'B'}) &&
      Find(new char[]{'W', 'O', 'G'}).InPosition(new char[]{'W', 'O', 'G'}) && Find(new char[]{'Y', 'O', 'G'}).InPosition(new char[]{'Y', 'O', 'G'});
  }
  char FindMisaligned() {
    Kockica kockica=Find(new char[]{'W', 'O', 'B'});
    if (!kockica.OrangeAligned()) return 'W';
    kockica=Find(new char[]{'Y', 'O', 'G'});
    if (!kockica.OrangeAligned()) return 'Y';
    kockica=Find(new char[]{'W', 'O', 'G'});
    if (!kockica.OrangeAligned()) return 'G';
    kockica=Find(new char[]{'Y', 'O', 'B'});
    if (!kockica.OrangeAligned()) return 'B';
    return 'N';
  }
  
  void Algorithm5(char front){
    Kockica kockica=new Kockica(Type.edge, null, null);
    TurnCounterClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnCounterClockwise('R');
    TurnClockwise(kockica.GetCounterClockwiseFace('O', front));
    TurnClockwise('R');
  }
  
  boolean Solved(){
    for(int i=0; i<20; i++) if(!kockice[i].IsAligned()) return false;
    return true;
  }
  
}