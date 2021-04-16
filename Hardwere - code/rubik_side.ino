#include <Servo.h>

int i = 0;
int inByte;
int br = 0;
//white,red,black,orange,blue,green
int side_position[] = {1, 2, 3, 4, 5, 6};

Servo a1;
Servo a2;
Servo b1;
Servo b2;
Servo c1;
Servo c2;
Servo d1;
Servo d2;

int al = 170;
int a0 = 95;
int ad = 20;

int bl = 180;
int b0 = 105;
int bd = 35;

int cl = 168;
int c0 = 87;
int cd = 10;

int dl = 25;
int d0 = 90;
int dd = 175;

int del = 500;

void setup() {

  a1.attach(12);
  a2.attach(11);
  b1.attach(3);
  b2.attach(4);
  c1.attach(10);
  c2.attach(9);
  d1.attach(7);
  d2.attach(6);

  a1.write(180);
  b1.write(180);
  c1.write(180);
  d1.write(180);
  delay(del);

  a2.write(a0);
  b2.write(b0);
  c2.write(c0);
  d2.write(d0);
  delay(del);

  delay(3000);

  a1.write(90);
  b1.write(90);
  c1.write(90);
  d1.write(90);
  delay(1500);

  Serial.begin(9600);

}

void anazad() {

  a2.write(al);
  delay(del);
  a1.write(180);
  delay(del);
  a2.write(a0);
  delay(del);
  a1.write(90);
  delay(del);

}

void anapred() {

  a2.write(ad);
  delay(del);
  a1.write(180);
  delay(del);
  a2.write(a0);
  delay(del);
  a1.write(90);
  delay(del);

}

void bnazad() {

  b2.write(bd);
  delay(del);
  b1.write(180);
  delay(del);
  b2.write(b0);
  delay(del);
  b1.write(80);
  delay(del);

}

void bnapred() {

  b2.write(bl);
  delay(del);
  b1.write(180);
  delay(del);
  b2.write(b0);
  delay(del);
  b1.write(80);
  delay(del);

}

void clevo() {

  c2.write(cl);
  delay(del);
  a1.write(80);
  b1.write(80);
  delay(del);
  c1.write(180);
  delay(del);
  c2.write(c0);
  delay(del);
  c1.write(80);
  delay(del);

}

void cdesno() {
  c2.write(cd);
  delay(del);
  a1.write(80);
  b1.write(80);
  delay(del);
  c1.write(180);
  delay(del);
  c2.write(c0);
  delay(del);
  c1.write(80);
  delay(del);

}

void dlevo() {
  d1.write(80);
  delay(del);
  d2.write(dl);
  delay(del);
  d1.write(180);
  delay(del);
  d2.write(d0);
  delay(del);
  d1.write(80);
  delay(del);

}

void ddesno() {
  d1.write(80);
  delay(del);
  d2.write(dd);
  delay(del);
  d1.write(180);
  delay(del);
  d2.write(d0);
  delay(del);
  d1.write(80);
  delay(del);

}

void abnazad() {

  b1.write(180);
  delay(del);
  b2.write(bl);
  delay(del);
  b1.write(80);
  delay(del);
  c1.write(180);
  d1.write(180);
  delay(del);
  a2.write(al);
  b2.write(b0);
  delay(del);
  c1.write(80);
  d1.write(80);
  delay(del);
  a1.write(180);
  delay(del);
  a2.write(a0);
  delay(del);
  a1.write(90);
  delay(del);

}

void abnapred() {
  c1.write(75);
  d1.write(75);
  delay(del);
  b1.write(180);
  delay(del);
  b2.write(bd);
  delay(del);
  b1.write(80);
  delay(del);
  c1.write(180);
  d1.write(180);
  delay(del);
  a2.write(ad);
  b2.write(b0);
  delay(del);
  c1.write(80);
  d1.write(80);
  delay(del);
  a1.write(180);
  delay(del);
  a2.write(a0);
  delay(del);
  a1.write(90);
  delay(del);

}

void cdlevo() {
  c1.write(75);
  d1.write(75);
  delay(del);
  a1.write(180);
  b1.write(180);
  delay(del);
  c2.write(cl);
  d2.write(dl);
  delay(del);
  a1.write(75);
  b1.write(75);
  delay(del);
  c1.write(180);
  d1.write(180);
  delay(del);
  d2.write(d0);
  c2.write(c0);
  delay(del);
  c1.write(80);
  d1.write(80);
  delay(del);

}

void cddesno() {
  c1.write(75);
  d1.write(75);
  delay(del);
  a1.write(180);
  b1.write(180);
  delay(del);
  c2.write(cd);
  d2.write(dd);
  delay(del);
  a1.write(75);
  b1.write(75);
  delay(del);
  c1.write(180);
  d1.write(180);
  delay(del);
  c2.write(c0);
  d2.write(d0);
  delay(del);
  c1.write(75);
  d1.write(75);
  delay(del);

}

void pomeri_open() {
  a1.write(180);
  b1.write(180);
  delay(del);
  a2.write(ad);
  b2.write(bd);
  delay(del);
  a1.write(80);
  b1.write(80);
  delay(del);
  c1.write(180);
  d1.write(180);
  delay(del);
}

void pomeri_close() {
  c1.write(80);
  d1.write(80);
  delay(del);
  a1.write(180);
  b1.write(180);
  delay(del);
  a2.write(a0);
  b2.write(b0);
  delay(del);
  a1.write(80);
  b1.write(80);
  delay(del);
}

void rotate_A() {
  abnapred();
}

void rotate_B() {
  cdlevo();
}

void rotate_B1() {
  cddesno();
}

void L_A() {
  anazad();
}

void L2_A() {
  anazad();
  anazad();
}

void L_B() {
  anapred();
}

void L2_B() {
  anapred();
  anapred();
}

void R_B() {
  bnazad();
}

void R2_B() {
  bnazad();
  bnazad();
}

void R_A() {
  bnapred();
}

void R2_A() {
  bnapred();
  bnapred();
}

void F_A() {
  abnapred(); //F
  ddesno();
  //abnazad();
}

void F_B() {
  abnapred(); //F'
  dlevo();
  //abnazad();
}

void F2_A() {
  abnapred(); //2F
  ddesno();
  ddesno();
  //abnazad();
}

void F2_B() {
  abnapred(); //2F'
  dlevo();
  dlevo();
  //abnazad();
}

void B_A() {
  abnazad(); //B
  ddesno();
  //abnapred();
}

void B_B() {
  abnazad(); //B'
  dlevo();
  //abnapred();
}

void B2_A() {
  abnazad(); //2B
  ddesno();
  ddesno();
  //abnapred();
}

void B2_B() {
  abnazad(); //2B'
  dlevo();
  dlevo();
  //abnapred();

}

void U_A() {
  ddesno();
}

void U_B() {
  dlevo();
}

void U2_A() {
  ddesno();
  ddesno();
}

void U2_B() {
  dlevo();
  dlevo();
}

void D_A() {
  clevo();
}

void D_B() {
  cdesno();
}

void D2_A() {
  clevo();
  clevo();
}

void D2_B() {
  cdesno();
  cdesno();
}

void side(int inByte) {
  if (inByte == 0) {
    L_A();
    Serial.print(0);
  }
  if (inByte == 1) {
    L_B();
    Serial.print(0);
  }

  if (inByte == 2) {
    R_A();
    Serial.print(0);
  }

  if (inByte == 3) {
    R_B();
    Serial.print(0);
  }

  if (inByte == 4) {
    U_A();
    Serial.print(0);
  }

  if (inByte == 5) {
    U_B();
    Serial.print(0);
  }

  if (inByte == 6) {
    D_A();
    Serial.print(0);
  }

  if (inByte == 7) {
    D_B();
    Serial.print(0);
  }

  if (inByte == 8) {
    B_A();
    //-1
    for (int i = 0; i < 4; i++) {
      side_position[i] = side_position[i] + 1;
      if (side_position[i] == 5) {
        side_position[i] = 1;
      }
    }
    Serial.print(0);
  }

  if (inByte == 9) {
    B_B();
    for (int i = 0; i < 4; i++) {
      side_position[i] = side_position[i] + 1;
      if (side_position[i] == 5) {
        side_position[i] = 1;
      }
    }
    Serial.print(0);
  }

  if (inByte == 10) {
    F_A();
    for (int i = 0; i < 4; i++) {
      side_position[i] = side_position[i] - 1;
      if (side_position[i] == 0) {
        side_position[i] = 4;
      }
    }
    Serial.print(0);
  }

  if (inByte == 11) {
    F_B();
    for (int i = 0; i < 4; i++) {
      side_position[i] = side_position[i] - 1;
      if (side_position[i] == 0) {
        side_position[i] = 4;
      }
    }
    Serial.print(0);
  }

  if (inByte == 20) {
    pomeri_open();
    Serial.print(0);
  }

  if ((inByte >= 21) && (inByte <= 23)) {
    pomeri_close();
    rotate_A();
    pomeri_open();
    Serial.print(0);
  }

  if (inByte == 24) {
    pomeri_close();
    rotate_A();
    rotate_B();
    pomeri_open();
    Serial.print(0);
  }

  if (inByte == 25) {
    pomeri_close();
    rotate_B1();
    rotate_B1();
    pomeri_open();
    Serial.print(0);
  }

  if (inByte == 26) {
    pomeri_close();
    rotate_B();
    Serial.print(0);
  }
}

void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    if (side_position[0] == 1) {
      side(inByte);
    } else if (side_position[0] == 2) {
      switch (inByte) {
        case 4: inByte = 10;
          break;
        case 5: inByte = 11;
          break;
        case 6: inByte = 8;
          break;
        case 7: inByte = 9;
          break;
        case 8: inByte = 4;
          break;
        case 9: inByte = 5;
          break;
        case 10: inByte = 6;
          break;
        case 11: inByte = 7;
          break;
      }
      side(inByte);
    }
    else if (side_position[0] == 3) {
      switch (inByte) {
        case 4: inByte = 6;
          break;
        case 5: inByte = 7;
          break;
        case 6: inByte = 4;
          break;
        case 7: inByte = 5;
          break;
        case 8: inByte = 10;
          break;
        case 9: inByte = 11;
          break;
        case 10: inByte = 8;
          break;
        case 11: inByte = 9;
          break;
      }
      side(inByte);
    }
    else if (side_position[0] == 4) {
      switch (inByte) {
        case 4: inByte = 8;
          break;
        case 5: inByte = 9;
          break;
        case 6: inByte = 10;
          break;
        case 7: inByte = 11;
          break;
        case 8: inByte = 6;
          break;
        case 9: inByte = 7;
          break;
        case 10: inByte = 4;
          break;
        case 11: inByte = 5;
          break;
      }
      side(inByte);
    }
  }
}
