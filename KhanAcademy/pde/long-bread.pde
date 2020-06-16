void setup()
{
  size(400,400);
  background(255,255,255);
  fill(0, 0, 0);
  fill(0, 0, 0);
  textSize(13);
  text("Click and drag your mouse!", 7, 392);
  text("Press any key to pause", 7, 373);

  strokeWeight(1);
  frameRate(0);

  //fill(255);
  //noLoop();
}

var angle = 0;
var iangle = 0;
var radius = 25;
var iradius = 25;
var centerX = 200;
var centerY = 200;
var csize = 70;
var icsize = 70;

var draw = function() {
    var paused = false;
    if (keyIsPressed){
        var paused = !paused;
    }
    if (!paused)
    {
        if (mouseIsPressed) {
            centerX = mouseX;
            centerY = mouseY;
        }
        fill(random(0,255), random(0,255), random(0,255));
        var x = sin(angle) * radius;
        var y = cos(angle) * radius;
        ellipse(x + centerX, y + centerY, icsize, csize);
        angle = angle + -1.99;
        radius = radius + -0.20;
        csize = csize + 0.53;
        if (csize<0)
        {
            angle = iangle;
            radius = iradius;
            csize = icsize;
            centerX = random(0,400);
            centerY = random(0,400);
            x = centerX;
            y = centerY;
        }
    }
};

