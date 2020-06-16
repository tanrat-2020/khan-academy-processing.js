draw = function() {

background(237, 237, 237);
fill(59, 108, 140);
textSize(34);
text("coursera" ,130,289);

renameThis(200,200,0.5,0.5,0,0xFF0000FF,0xFF000000,4);
}

var renameThis = function(x,y,sx,sy,r,fc,sc,sw){
 /* Created with https://www.khanacademy.org/cs/curvevertexxy/4922655547326464 by Troy Cook */
    pushMatrix();
    pushStyle();
    translate(x,y);
    scale(sx,sy);
    rotate(r);
    fill(59, 108, 140);
    stroke(sc);
    strokeWeight(sw);
    beginShape();
    curveVertex(-145,-9); curveVertex(-145,-64); curveVertex(-95,-129); curveVertex(-64,-107); curveVertex(-101,-58); curveVertex(-92,-10); curveVertex(-39,3); curveVertex(-32,-20); curveVertex(-17,-46); curveVertex(-1,-89); curveVertex(23,-100); curveVertex(115,-103); curveVertex(150,-61); curveVertex(145,-4); curveVertex(103,55); curveVertex(36,59); curveVertex(29,13); curveVertex(94,9); curveVertex(104,-35); curveVertex(67,-78); curveVertex(31,-61); curveVertex(17,-18); curveVertex(-7,11); curveVertex(-37,48); curveVertex(-114,33); curveVertex(-145,-9); curveVertex(-145,-64); curveVertex(-95,-129); /**/
    endShape();
    popStyle();
    popMatrix();
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