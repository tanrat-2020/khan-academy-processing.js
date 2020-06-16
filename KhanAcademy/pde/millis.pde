draw = function() {
    background(153, 153, 153);
    var m = millis();

    text(m + " generations elapsed", 100, 150);
    ellipse(m % width, 200, 30, 30);

};

void setup()
{
  size(400,400);
  background(100);
  //noLoop();
}