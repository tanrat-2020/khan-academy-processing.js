draw = function() {
noStroke();

fill(76, 85, 191);
rect(100,150,100,100);//outer "T"

fill (123,131,236);
rect(216,190,40,75);
ellipse(235,170,30,30);//big person

fill(76, 85, 191);
rect(265,200,40,55);
ellipse(285,180,30,30);// small person

fill(230,231,233);
rect(140,167,23,69);
rect(117,166,71,23);//  "T"255, 0, 0);
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