Creature[] goons;
PImage moneyImg;
void setup() {

  size(800, 800);
  background(206, 146, 48);
  //goons = new Creature[(int)(Math.random()*200)];
  moneyImg = loadImage("money-wings.png");
  goons = new Creature[60000];
  for (int i = 0; i < 6; i++) {

    randomColor = color((int)(Math.random()*255+150), (int)(Math.random()*255+30), (int)(Math.random()*255+60));
    goons[i] = new Creature(400, 400, randomColor, (int)(Math.random()*6+7), 15+(int)(Math.random()*18-9));
  }
}

int cycles = 0;
int randomColor = color((int)(Math.random()*255+90), (int)(Math.random()*255+60), (int)(Math.random()*255+1));

boolean stolen = false;
int storedCreatures = 6;
void draw() {
  background(206, 146, 48);
  randomColor = color((int)(Math.random()*255+150), (int)(Math.random()*255+30), (int)(Math.random()*255+60));
  for (int i = 0; i < storedCreatures; i++) {
    goons[i].move();
    goons[i].show();
    //System.out.println(goons[i].myLifespan);
    if (dist(mouseX, mouseY, goons[i].myX, goons[i].myY) < 20 && goons[i].myLifespan > 1) {
      //System.out.println("money stolen");
      if ((int)(Math.random()*100) > 97) {
        goons[storedCreatures] = new Creature(goons[i].myX+(int)(Math.random()*100-50), goons[i].myY+(int)(Math.random()*100-50), randomColor, (int)(Math.random()*6+7), 15+(int)(Math.random()*18-9));
        storedCreatures++;
      }


      stolen = true;
      //noLoop();
      if (goons[i].orientation == true) {
        image(moneyImg, 281-318+goons[i].myX-20, 274-281+goons[i].myY-20, 50, 50);
      } else {
        image(moneyImg, 281-318+goons[i].myX+50, 274-281+goons[i].myY-20, 50, 50);
      }
    }
    //if (stolen == false)image(moneyImg, mouseX-20, mouseY-20, 50, 50);
    image(moneyImg, mouseX-20, mouseY-20, 50, 50);
  }
}
void mousePressed() {
  loop();

  stolen = false;


  randomColor = color((int)(Math.random()*255+90), (int)(Math.random()*255+1), (int)(Math.random()*255+1));
}
boolean isLoop = true;
void keyPressed() {
  System.out.println(keyCode);
  if (keyCode == 32&&isLoop == true) {
    noLoop();
    isLoop = false;
  } else if (keyCode == 32 && isLoop == false) {
    loop();
    isLoop = true;
  }
}

class Creature {
  int myX;
  int myY;
  int myColor;
  int mySpeed;
  double myLifespan;
  boolean orientation; // left = true, right = false
  Creature(int x, int y, color rgb, int speed, int lifespan) {
    myX = x;
    myY = y;
    myColor = color(rgb);
    move();
    show();
    myLifespan = lifespan*60; // lifespan in seconds

    mySpeed = speed;
  }

  /* Creature(int x, int y, float lifespan, int speed) {
   myX = x;
   myY = y;
   myColor = color(61, 224, 138);
   myLifespan = lifespan;
   move();
   show();
   
   
   mySpeed = speed;
   }
   */
  void show() {
    fill(myColor);
    if (myLifespan > 0) {
      /*
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
       */

      line(181-197+myX, 368-327+myY, 197-197+myX, 350-327+myY);
      line(208-197+myX, 368-327+myY, 197-197+myX, 350-327+myY);
      line(197-197+myX, 350-327+myY, 197-197+myX, 316-327+myY);

      if (orientation == true) {
        //right pointing
        // left pointing
        line(197-197+myX, 327-327+myY, 185-197+myX, 323-327+myY);
        line(197-197+myX, 327-327+myY, 185-197+myX, 335-327+myY);
      } else {
        line(197-197+myX, 327-327+myY, 209-197+myX, 323-327+myY);
        line(197-197+myX, 327-327+myY, 209-197+myX, 335-327+myY);
      }




      ellipse(197-197+myX, 308-327+myY, 17, 17);
    }
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
    if (myLifespan !=999999999) myLifespan--;
  }
}
