draw = function() {
    noStroke();//for perfection!

    fill(59, 83, 156);
    rect(100,100,200,200);//main body

    fill(255, 255, 255);
    rect(100,100,20,20);//top left
    rect(100,280,20,20);//bottom left
    rect(280,100,20,20);//top right
    rect(280,280,20,20);//bottom right

    fill(59, 83, 156);
    arc(121,121,40,40,180,270);//top left
    arc(121,280,40,40,90,180);//bottom left
    arc(280,121,40,40,270,360);//top right
    arc(280,280,40,40,360,450);//bottom right

    fill(255, 255, 255);// the"f"
    textSize(217);
    text("f",213,300);
};


void setup(){
  size(400,400);
  background(255,255,255);
  noLoop();

}