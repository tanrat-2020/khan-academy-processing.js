void setup()
{
  size(400,400);
  background(255,255,255);
  //fill(255);
  noLoop();
  /*PFont fontA = loadFont("courier");
  textFont(fontA, 14);*/
}

void draw(){
      noStroke();//for perfection!

      fill(252, 140, 44);//orange
      rect(100,200,100,100);

      fill(100, 84, 228);//purple
      rect(200,200,100,100);

      fill(36, 132, 236);//blue
      rect(200,100,100,100);

      fill(252, 76, 116);//pink
      rect(100,100,100,100);

      fill(60, 60, 60);//black
      rect(125,125,150,150);

      fill(255,255,255);//white
      textSize(93);
      text("IJ",139,200);//IJ
      text("_",139,237);//_
}