Creature[] goons;
PImage moneyImg;
void setup() {

  size(1000,900);
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
boolean giant = false;
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
      if(goons[i].large == true) {
        stolen = true;
        isLoop = false;
        noLoop();
      }
      //System.out.println("money stolen");
      int reproduceChance = (int)(Math.random()*50000);
      if (reproduceChance > 48500 && reproduceChance != 1) {
        goons[storedCreatures] = new Creature(goons[i].myX+(int)(Math.random()*100-50), goons[i].myY+(int)(Math.random()*100-50), randomColor, (int)(Math.random()*6+12), 15+(int)(Math.random()*18-9));
        storedCreatures++;
      }else if(reproduceChance == 1 && giant == false){
        goons[storedCreatures] = new Creature(45);
        storedCreatures++;
        giant = true;
      }


      //stolen = true;
      //noLoop();
      if (goons[i].orientation == true) {
        image(moneyImg, 281-318+goons[i].myX-20, 274-281+goons[i].myY-20, 50, 50);
      } else {
        image(moneyImg, 281-318+goons[i].myX+50, 274-281+goons[i].myY-20, 50, 50);
      }
    } // end of distance check
    if (stolen == false)image(moneyImg, mouseX-20, mouseY-20, 50, 50);
    //image(moneyImg, mouseX-20, mouseY-20, 50, 50);
  }
}
void mousePressed() {
  if(isLoop == true){
    noLoop();
    isLoop = false;
  }else if(isLoop == false){
    loop();
    isLoop = true;
  }
  

  stolen = false;


  randomColor = color((int)(Math.random()*255+90), (int)(Math.random()*255+1), (int)(Math.random()*255+1));
}
boolean isLoop = true;


class Creature {
  int myX;
  int myY;
  int myColor;
  int mySpeed;
  double myLifespan;
  boolean orientation; // left = true, right = false
  boolean large;
  Creature(int x, int y, color rgb, int speed, int lifespan) {
    myX = x;
    myY = y;
    myColor = color(rgb);
    //move();
   // show();
    myLifespan = lifespan*60; // lifespan in seconds

    large = false;
    mySpeed = speed;
  }

  Creature(int speed) {
    myX = 0;
    myY = 0;
    myColor = color(89, 173, 73);
    myLifespan = 999999999;
    //move();
   // show();
    large = true;

    mySpeed = speed;
  }

  void show() {
    fill(myColor);
    if (myLifespan > 0) {
      if (large == true) {
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
      } else {
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
    /*
      
     */
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
