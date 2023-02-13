
PImage img;

float x,y,x2,y2;

boolean dPressed = false;
boolean aPressed = false;
boolean rPressed = false;
boolean lPressed = false;

PFont font;

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
}


void draw(){
  
  //background
  image(img,0,0,width,height);

  drawText();
  player1();
  player2();
  enemy();
  
} 

void drawText(){
  //player 1 and player 2 divider
  stroke(255);
  strokeWeight(5);
 line(displayHeight-180,0,displayHeight-180,5000);
  
  //Score and lives for player 1
 textSize(50);
 text("Score: ",width/17,height/1.1);
  
  //Score and lives for player 2
  textSize(50);
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

void enemy(){
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
}
