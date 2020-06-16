var myName = function(){
    var textZ = random(50,350);
    var textX = random(50, 350);
    var textY = random(50, 350);
    var yourName = "Tanmay";

    fill(textY, textX, textZ);
    textSize(30);
    text( "super" + yourName, textX, textY);
};

draw = function() {
myName();
};

mouseClicked = function () {
  background(255, 255, 255);
    playSound(getSound("rpg/giant-no"));


};


void setup()
{
  size(400,400);
  background(255,255,255);
  //noLoop();
  /*PFont fontA = loadFont("courier");
  textFont(fontA, 14);*/
}