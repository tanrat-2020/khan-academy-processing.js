draw = function() {
stroke(60, 68, 60);
strokeWeight(2);
noFill();
ellipse(190,190,200,200);

stroke(60, 60, 60);
strokeWeight(12);
noFill();
ellipse(205,205,200,200);

rotate(25);

renameThisi(352,129,0.5,0.5,0,0xFF0000FF,0xFF000000,4);
renameThis(352,129,0.5,0.5,0,0xFF0000FF,0xFF000000,4);

rotate(-27);
var f = createFont("cursive");
textFont(f,57);
fill(0, 0, 0);
text("Indic", 132, 207);
text("Panda",120,256);
};

var renameThis = function(x,y,sx,sy,r,fc,sc,sw){
 /* Created with https://www.khanacademy.org/cs/curvevertexxy/4922655547326464 by Troy Cook */
    pushMatrix();
    pushStyle();
    translate(x,y);
    scale(sx,sy);
    rotate(r);
    fill(148, 223, 49);
    stroke(sc);
    strokeWeight(sw);
    beginShape();
    curveVertex(-33,-159); curveVertex(39,-104); curveVertex(73,-39); curveVertex(67,24); curveVertex(30,67); curveVertex(-15,-25); curveVertex(-3,70); curveVertex(-73,41); curveVertex(-96,-30); curveVertex(-73,-110); curveVertex(-22,-159); curveVertex(39,-104); curveVertex(73,-39); /**/
    endShape();
    popStyle();
    popMatrix();
};
var renameThisi = function(x,y,sx,sy,r,fc,sc,sw){
 /* Created with https://www.khanacademy.org/cs/curvevertexxy/4922655547326464 by Troy Cook */
    pushMatrix();
    pushStyle();
    translate(x,y);
    scale(sx,sy);
    rotate(52);
    fill(116, 164, 60);
    stroke(sc);
    strokeWeight(sw);
    beginShape();
    curveVertex(-33,-159); curveVertex(39,-104); curveVertex(73,-39); curveVertex(67,24); curveVertex(30,67); curveVertex(-15,-25); curveVertex(-3,70); curveVertex(-73,41); curveVertex(-96,-30); curveVertex(-73,-110); curveVertex(-22,-159); curveVertex(39,-104); curveVertex(73,-39); /**/
    endShape();
    popStyle();
    popMatrix();
};

void setup(){
  size(400,400);
  background(255,255,255);
  //noLoop();

}




