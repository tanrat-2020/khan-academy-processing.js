mouseClicked = function() {


background(246,250,250);
var y = 100;

var from = color(43,183,251);
var to = color(44,138,251);
var interA = lerpColor(from, to, 1.05);
var interB = lerpColor(from, to, 1.54);
rotate(90);
fill(from);
rect(191, -250, 50, y);

fill(interA);
rect(220, -250, 46, y);

fill(interB);
rect(250, -250, 50, y);

fill(to);
rect(282, -250, 35, y);
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