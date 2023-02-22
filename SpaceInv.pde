
//PImage img;

float x,y,x2,y2,x3,y3;
float bx,by,bx2,by2;
float ex,ey;

boolean dPressed = false;
boolean aPressed = false;
boolean rPressed = false;
boolean lPressed = false;
boolean wPressed = false;
boolean uPressed = false;
boolean shoot = false;
boolean shoot2 = false;

int reload;

PFont font;

float speed;
float speed2;

boolean colliding;
Enemy f = new Enemy(100,100);

ArrayList<Enemy> Enemies1 = new ArrayList<Enemy>();
ArrayList<Enemy> Enemies2 = new ArrayList<Enemy>();


float step;
void setup()
{ 
  //screen size
  fullScreen();
  
  //background image
  //img = loadImage("space.jpg");
  
  //player 1's starting position
  x=width/4;
  y=height/1.5;
  
  //player 2's starting position
  x2=width/1.5;
  y2=height/1.5;
  
  //bullet1 speed
  speed=40;
  bx = x;
  by = y;
  
  //bullet2 speed
  speed2=40;
  bx2 = x2;
  by2=y2;
  
  
  //enemy movement
  step = 5;
  ex=width/17;
  ey=height/9;
  
  for(int i=0; i<=15; i++){
    int rowPos = 0;
}
}


void draw(){
  
  //background
  background(0);
  //image(img,0,0,width,height);
  
  drawText();
  player1();
  player2();
  bullet1();
  bullet2();
  f.update();
 
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
  rect(x-40,y+40,150,20);
  //rect(x+25,y-20,10,20);
  
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
  rect(bx+30,by+5,2,5);

   //boolean to see if w was pressed
  if(wPressed){
    shoot = true;
    
  }
  //if that w was pressed the bullet is released
  if(shoot){
    by=by-speed;
  }
  //reloading
  if(by<=80){
    by=y;
    bx=x;
    shoot = false;
  }
//keeps bullet with the player
  if(aPressed && bx>=displayWidth*.03){
    bx=bx-15;
  }
  else if(dPressed && bx<=displayWidth*.40){
    bx=bx+15;
  }

  
 }
 
 
  void bullet2(){
   //Starting location and shape of the bullet for player 2 
  stroke(255);
  fill(255,255,255);
  rect(bx2+30,by2+5,2,5);
  //boolean to see if the up arrow was pressed
  if(uPressed){
    shoot2 = true;
  }
   //if that up arrow was pressed the bullet is released
  if(shoot2){
    by2=by2-speed2;
  }
  //reloading
  if(by2<=20){
    by2=y2;
    bx2=x2;
    shoot2 = false;
  }
  //keeps bullet with the player when not being fired
  if(lPressed && bx2>=displayWidth*.55){
    bx2=bx2-15;
  }
  else if(rPressed && bx2<=displayWidth*.94){
    bx2=bx2+15;
  }
  }
  
//Enemy
class Enemy{
  
  int x, y;
  Enemy(int ex, int ey){
    x = ex;
    y = ey;
  }
 
  void update(){
stroke(0);
    fill(255,255,255);
    rect(ex,ey,60,60);
    if((by<=ey+5 && by>=ey-5) && (bx<=ex+50 && bx>=ex-50)){
    ey=ey-40000;
    }
  }
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
