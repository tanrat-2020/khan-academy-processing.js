// position of the ball
var y = 20;
// how far the ball moves every time
var speed = 2;
var x = 20;
draw = function() {
    background(x, x, x);

    fill(mouseX, mouseY, mouseY);
    ellipse(mouseX, y, mouseY, mouseX);

    //move the ball faster
    y = y + speed;
    x = x + random(0,400);

    if (y > 400) {
    speed = -5;
    }

    // move the ball even faster!
    y = y + speed;
    x = x + speed;
    if (y < 0) {
    speed = 5;
    }
};

void setup()
{
  size(400,400);
  background(255,255,255);
  noStroke();
  //fill(255);
  //noLoop();
}