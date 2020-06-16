draw=function(){
noStroke();
fill(85, 144, 246);
rect(100,60,200,300);
fill(255,255,255);
rect(250,60,50,50);
fill(166, 197, 251);
triangle(250,60,250,110,300,110);


fill(242, 242, 242);
rect(115,175,175,30);
rect(115,220,175,30);
rect(115,265,140,30);
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
