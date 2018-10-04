int r=60;
float ballX;
float ballY;

void setup() {
  size(600,400);
  background(244,205,105);
}

void draw(){

  fill(#FFA005);
  fill(166,255,88);
  for (float i=0;i<PI*2;i+=2*PI/5) {
  ballX=width/2 + r*cos(i);
  ballY=height/2 + r*sin(i);
  ellipse(ballX,ballY,r,r); 
  }
  fill(200,0,99);
  ellipse(width/2,height/2,r*1.2,r*1.2);
}  
 
