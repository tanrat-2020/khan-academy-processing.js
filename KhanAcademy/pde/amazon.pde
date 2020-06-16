draw = function() {
noStroke();
var q = 190;
var qw = q + 4;
var w = 212;
var wq = w + 19;
var f = createFont("sans-serif");
textFont(f,188);
fill(36,36,36);
text("a", 140, 213);
fill(250,155,4);
arc(q,244,260,200,16,196);
fill(255, 255, 255);
arc(qw,229,242,197,9,187);

fill(250,155,4);
triangle(312,w,293,255,336,258);
fill(255, 255, 255);
triangle(312,wq,284,261,348,261);
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