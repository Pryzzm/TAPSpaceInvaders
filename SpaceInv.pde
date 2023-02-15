
PImage img;

float x,y,x2,y2,x3,y3;
float ex,ey,ex2,ey2;

boolean dPressed = false;
boolean aPressed = false;
boolean rPressed = false;
boolean lPressed = false;
boolean wPressed = false;
boolean uPressed = false;
boolean shoot = false;
boolean shoot2 = false;

PFont font;

float speed;
float speed2;

boolean colliding;

void setup()
{ 
  //screen size
  size(displayWidth,displayHeight);
  
  //background image
  img = loadImage("space.jpg");
  
  //player 1's starting position
  x=width/4;
  y=height/1.5;
  
  //player 2's starting position
  x2=width/1.5;
  y2=height/1.5;
  
  //bullet1 speed
  speed=40;
  ex = x;
  ey = y;
  
  //bullet2 speed
  speed2=40;
  ex2 = x2;
  ey2=y2;
}


void draw(){
  
  //background
  image(img,0,0,width,height);
  

  drawText();
  player1();
  player2();
  enemy1();
  bullet1();
  bullet2();
  
} 

void drawText(){
  //player 1 and player 2 divider
  stroke(255);
  strokeWeight(5);
 line(displayHeight-180,0,displayHeight-180,5000);
  
  //Score and lives for player 1
 textSize(50);
 fill(255,255,255);
 text("Score: ",width/17,height/1.1);
  
  //Score and lives for player 2
  textSize(50);
  fill(255,255,255);
 text("Score: ",width*.60,height/1.1);
}

void player1(){
  //player 1 object
  stroke(0);
  fill(255,255,255);
  rect(x,y,60,60);
  
  //player 1's movement
  if(aPressed && x>=displayWidth*.03){
    x=x-15;
  }
  else if(dPressed && x<=displayWidth*.40){
    x=x+15;
  }
  
}

void player2(){
  //player 2 object
  stroke(0);
  fill(255,255,255);
  rect(x2,y2,60,60);
  
  
  //player 2's movement
  if(lPressed && x2>=displayWidth*.55){
    x2=x2-15;
  }
  else if(rPressed && x2<=displayWidth*.94){
    x2=x2+15;
  }
}
  
  void bullet1(){
  //Starting location and shape of the bullet for player 1 
  stroke(255);
  fill(255,255,255);
  rect(ex+30,ey+5,2,5);

   //boolean to see if w was pressed
  if(wPressed){
    shoot = true;
  }
  //if that w was pressed the bullet is released
  else if(shoot){
    ey=ey-speed;
  }
  //moves the location of the bullet to where the player is
  else{
    ex=x;
    ey=y;
  }
  
 }
 
 
  void bullet2(){
   //Starting location and shape of the bullet for player 2 
  stroke(255);
  fill(255,255,255);
  rect(ex2+30,ey2+5,2,5);
  //boolean to see if the up arrow was pressed
  if(uPressed){
    shoot2 = true;
  }
   //if that up arrow was pressed the bullet is released
  else if(shoot2){
    ey2=ey2-speed2;
  }
  //moves the location of the bullet to where the player is
  else{
    ex2=x2;
    ey2=y2;
  }
  }
  

void enemy1(){
  stroke(0);
  fill(255,255,255);
  rect(width/17,height/9,70,70);
  
  stroke(0);
  fill(255,255,255);
  rect(width/7,height/9,70,70);
  
  stroke(0);
  fill(255,255,255);
  rect(width/4.5,height/9,70,70);
  
  stroke(0);
  fill(255,255,255);
 rect(width/3.4,height/9,70,70);
  
  stroke(0);
  fill(255,255,255);
  rect(width/2.7,height/9,70,70);
  
}



void keyPressed(){
  //player 1's movement
  if(key=='a')
  {
    aPressed = true;
   
  }
  else if(key=='d')
  {
   dPressed = true;
  }
  
  //player 2's movement
  if(keyCode==LEFT)
  {
    lPressed = true;
   
  }
  else if(keyCode==RIGHT)
  {
   rPressed = true;
  }
  
  //bullet for player 1
  if (key =='w'){
    wPressed = true;
  }
  
  //bullet for player 2
  if (keyCode == UP){
      uPressed = true;
  }
 
}

void keyReleased(){
  
  //player 1's movement
  if(key=='a')
  {
    aPressed = false;
   
  }
  else if(key=='d')
  {
   dPressed = false;
  }
  //player 2's movement
  if(keyCode==LEFT)
  {
    lPressed = false;
   
  }
  else if(keyCode==RIGHT)
  {
   rPressed = false;
  }
  
  if (key =='w'){
    wPressed = false;
  }
  
  if (keyCode == UP){
      uPressed = false;
  }
  
}
