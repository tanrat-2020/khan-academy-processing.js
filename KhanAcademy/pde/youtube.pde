var q = 115;//vars
var qq = 234;

draw=function(){
noStroke();
background(255, 255, 255);


fill(255, 0, 0);
rect(100,100,200,150);// big "rect" "(main body)"

fill(255, 255, 255);//op
rect(95,95,20,20);//op
fill(255, 0, 0);//side fill
arc(q, q, 30, 30, 180, 270);//corner top left

fill(255, 255, 255);//op
rect(95,234,20,20);//op
fill(255, 0, 0);//side fill
arc(q, qq, 30, 30, 90, 180);//corner bottom left

fill(255, 255, 255);//op
rect(280,95,20,20);//op
fill(255, 0, 0);//side fill
arc(284, q, 30, 30, 26, 360);//corner top right

fill(255, 255, 255);//op
rect(280,230,20,20);//op
fill(255, 0, 0);//side fill
arc(280, 230, 40, 40, 360, 450);//corner bottom right
fill(255, 255, 255);
triangle(175,130,175,225,260,180);
};

mouseClicked = function() {
    background(255, 255, 255);
    stroke(0, 0, 0);
    fill(255, 255, 255);
    rect(50,50,300,50);//search bar

    fill(0, 0, 0);
    textSize(random(15,20));
    text("Search",65,80);//"search"

    noFill();
    stroke(0, 0, 0);
    ellipse(322,67,30,30);
    fill(199, 52, 52);
    line(331,95,327,82);// magnifing glass

    noFill();
    rect(0,170,399,60);
    image(getImage("cute/Star"),3,98);
    textSize(26);
    fill(0, 0, 0);
    text("A shooting star spotted!", 115,214);//first video

    noFill();
    rect(0,235,399,84);
    image(getImage("space/rocketship"),-27,160);
    textSize(26);
    fill(0, 0, 0);
    text("Fastest rocketship!",180,288);//second video

    noFill();
    rect(0,328,399,60);
    image(getImage("cute/Rock"),22,250);
    textSize(26);
    fill(0, 0, 0);
    text("Only one person has ...",111,363);//third video

};

void setup()
{
  size(400,400);
  background(255,255,255);
  //fill(255);
  //noLoop();
}










































