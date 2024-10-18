Creature[] goons;
PImage moneyImg;
void setup() {

  size(800, 800);
  background(206,146,48);
  //goons = new Creature[(int)(Math.random()*200)];

  goons = new Creature[4];
  for (int i = 0; i < goons.length; i++) {
    randomColor = color((int)(Math.random()*255+90), (int)(Math.random()*255+60            ), (int)(Math.random()*255+1));
    goons[i] = new Creature(400, 400, randomColor, (int)(Math.random()*10+10));
  }
  moneyImg = loadImage("money-wings.png");
}
int cycles = 0;
int randomColor = color((int)(Math.random()*255+90), (int)(Math.random()*255+60            ), (int)(Math.random()*255+1));
void draw() {
  background(206,146,48);
 image(moneyImg,mouseX-20,mouseY-20,50,50);
  for (int i = 0; i < goons.length; i++) {
    goons[i].move();
    goons[i].show();
  }
  
}
boolean clicked = false;
void mousePressed() {
  clicked = true;


  randomColor = color((int)(Math.random()*255+90), (int)(Math.random()*255+1), (int)(Math.random()*255+1));
}

class Creature {
  int myX;
  int myY;
  int myColor;
  int mySpeed;
  boolean orientation; // left = true, right = false
  Creature(int x, int y, int rgb, int speed) {
    myX = x;
    myY = y;
    myColor = color(rgb);
    move();
    show();

    mySpeed = speed;
  }
  void show() {
    fill(myColor);
    //ellipse(myX, myY, 5,5);
    //triangle(myX, myY, myX+5, myY, myX+3, myY-3);
    //reference location at 288,368
    /*
    line(0+myX, 0+myY, 318-288+myX, 337-368+myY);
     line(318-288+myX, 337-368+myY, 352-288+myX, 368-368+myY);
     line(318-288+myX, 337-368+myY, 319-288+myX, 258-368+myY);
     
     if (orientation == true) {
     line(318-288+myX, 281-368+myY, 281-288+myX, 295-368+myY); // arm
     line(318-288+myX, 281-368+myY, 281-288+myX, 274-368+myY); // arm
     } else {
     line(318-288+myX, 281-368+myY, 355-288+myX, 295-368+myY); // arm
     line(318-288+myX, 281-368+myY, 355-288+myX, 274-368+myY); // arm
     }
     ellipse(319-288+myX, 245-368+myY, 35, 35);
     */
    line(288-318+myX, 368-281+myY, 318-318+myX, 337-281+myY);
    line(318-318+myX, 337-281+myY, 352-318+myX, 368-281+myY);
    line(318-318+myX, 337-281+myY, 319-318+myX, 258-281+myY);
    if (orientation == true) {
      line(318-318+myX, 281-281+myY, 281-318+myX, 295-281+myY);
      line(318-318+myX, 281-281+myY, 281-318+myX, 274-281+myY);
    } else {
      line(318-318+myX, 281-281+myY, 355-318+myX, 295-281+myY);
      line(318-318+myX, 281-281+myY, 355-318+myX, 274-281+myY);
    }


    ellipse(318-318+myX, 245-281+myY, 35, 35);
  }
  void move() {
    while (myX > width) {
      myX = myX - 100;
    }
    while (myY > height) {
      myY = myY - 100;
    }
    if (myX > mouseX) {
      myX =  myX - (int)(Math.random()*mySpeed);
      orientation = true;
    } else {
      myX =  myX+ (int)(Math.random()*mySpeed);
      orientation = false;
    }
    if (myY > mouseY) {
      myY = myY - (int)(Math.random()*mySpeed);
    } else {
      myY = myY + (int)(Math.random()*mySpeed);
    }
  }
}
