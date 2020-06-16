draw=function(){
noStroke();
fill(85, 179, 66);
rect(100,100,200,200);

fill(242, 242, 242);
rect(150,100,20,200);//up down

rect(100,150,200,20);//side
fill(255, 255, 255);

rect(250,100,50,50);

fill(85, 179, 66);
arc(250, 150, 100, 100, -89, 1);

fill(255, 255, 255);
rect(250,250,50,50);
fill(85, 179, 66);
arc(249, 250, 100, 100, 0, 90);

fill(255, 255, 255);
rect(100,100,50,50);
fill(85, 179, 66);
arc(150, 150, 100, 100, 180, 270);

fill(255, 255, 255);
rect(100,250,50,50);
fill(85, 179, 66);
arc(150, 250, 100, 100, 90, 180);
};

void setup()
{
  size(400,400);
  background(255,255,255);
  //fill(255);
  noLoop();
  /*PFont fontA = loadFont("courier");
  textFont(fontA, 14);*/
}
