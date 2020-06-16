








// hey mrs. parnell....
//once you are done reading this slide, the click the next slide and do the same thing for the other slides.




void setup()
{
  size(400,400);
  background(255,255,255);
  noLoop();
  noStroke();
  drawScene1();
}

























var book = 200;
var currentScene = 1;
var lib = 346;
var l = 195;
var li = 208;
var liber = 133;
var libe = liber + 11;
var library = 7;

var drawScene1 = function() {
   currentScene = 1;
   background(255, 188, 117);
   fill(255, 255, 255);
   arc(208,l,lib,lib,137,400);
   fill(255, 188, 117);
   arc(li,l,li,li,137,400);
   fill(255, 0, 0);
   textSize(34);
   text("Cherry Chase",105,80);
   text("hello!",260,200);
   image(getImage("avatars/robot_male_2"),122,122);
};

var drawScene2 = function() {
    currentScene = 2;
    background(0, 255, 234);
    fill(120, 84, 84);
    rect(100,100,200,200);
    fill(0, 0, 0);
    textSize(34);
    text("LIBRARY",133,159);
    rect(150,180,100,120);
    image(getImage("avatars/robot_male_1"),54,23);
    text("go inside!",189,85);



};

var drawScene3 = function() {
    currentScene = 3;
    background(255, 255, 255);
    image(getImage("avatars/avatar-team"),172,234);
    image(getImage("avatars/robot_male_1"),234,79);
    image(getImage("avatars/robot_male_2"),3,238);
    image(getImage("cute/ChestOpen"),129,5);
    fill(28, 28, 199);
    rect(liber,library,12,123);
    fill(21, 122, 41);
    rect(libe,library,83,123);
    textSize(23);
    fill(0, 0, 0);
    text("Happy Retirment Mrs. Parnell!",38,100);

};



mouseClicked = function() {
    if (currentScene === 1) {
        drawScene2();
    } else if (currentScene === 2) {
        drawScene3();
    } else if (currentScene === 3) {
         drawScene1();

    }
};

