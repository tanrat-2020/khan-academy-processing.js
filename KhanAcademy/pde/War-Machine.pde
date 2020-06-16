/**CREDITS:
    Eternity, for teaching me how to make many things fall together.
    Lexicon, for letting me base the war machine head off his iron man head.
*/

//Variables
var keys = [], score = 0, scene = 'Menu', clicked = false, timer = 0, pieces = [], multiply = 20, speed = 2, limit = 700, scroll = 220;

//Key Movement
keyPressed = function(){
    keys[keyCode] = true;
};
keyReleased = function(){
    keys[keyCode] = false;
};

//Button
var button = function(x,y,siz,txtsiz,txt,sceen){
    //Button
    fill(40);
    if(dist(mouseX,mouseY,x,y) < siz/2){
        fill(0,255,255);
    }
    ellipse(x,y,siz,siz);
    fill(0, 255, 255);
    if(dist(mouseX,mouseY,x,y) < siz/2){
        fill(40);
    }
    ellipse(x,y,siz/1.2,siz/1.2);

    //Text
    fill(40);
    if(dist(mouseX,mouseY,x,y) < siz/2){
        fill(0,255,255);
    }
    textSize(txtsiz);
    text(txt,x,y);

    //Change
    if(clicked && dist(mouseX,mouseY,x,y) < siz/2){
        scene = sceen;
    }
};

//Tony Stark
var warMachine = function(){
    //Neck
    pushMatrix();
    translate(4,-28);
    scale(0.8);
    fill(25);
    rect(173,443,77,55);
    triangle(173,498,137,485,173,451);
    triangle(137,485,179,530,225,498);
    fill(20);
    rect(249,443,77,55);
    triangle(326,498,363,486,325,428);
    triangle(365,485,321,530,275,498);

    //Face
    fill(120);
    quad(100,110,110,220,250,250,250,60);
    quad(100,240,75,295, 250,315,250,275);
    quad(75,295,170,440, 250,440,250,310);
    triangle(170,440,188,464,199,440);
    fill(100);
    quad(400,110,390,220,250,250,250,60);
    quad(400,240,425,293, 250,310,250,270);
    quad(424,292,330,440, 250,440,250,307);
    triangle(301,440,311,465,330,440);

    //Cheek
    fill(80);
    triangle(406,320,306,325,313,465);
    triangle(90,320,180,325,186,465);

    //Eyebrow
    fill(90);
    quad(110,218,100,240,250,275,250,250);
    quad(250,250,250,275,400,240,390,220);

    //Chin Lining
    fill(180);
    triangle(90,320,190,479,188,464);
    triangle(200,440,190,479,188,464);
    quad(199,440,196,450,305,450,301,440);
    triangle(406,320,311,479,311,464);
    triangle(300,440,311,463,311,477);

    //Forehead
    fill(85);
    rect(201,42,100,136,95);

    //Sides
    fill(90);
    triangle(399,109,389,220,425,292);
    triangle(100,109,111,220,75,296);
    fill(15);
    triangle(90,320,137,485,173,451);
    triangle(406,320,363,485,329,449);

    //Eyes
    fill(0, 255, 255);
    quad(120,245,143,270,210,284,210,266);
    quad(295,266,295,284,360,270,375,245);
    popMatrix();
};
var guy = function(x,y){
    this.x = x;
    this.y = y;
};
guy.prototype.draw = function() {
    //Magnetic Field
    fill(255,255,0,100);
    rect(this.x - 30,this.y - 5,60,55,10);

    //Body
    fill(70);
    rect(this.x - 25,this.y,50,50,10);

    //Eyes
    fill(30);
    ellipse(this.x - 10,this.y + 15,10,10);
    ellipse(this.x + 10,this.y + 15,10,10);
    fill(150);
    rect(this.x - 10,this.y + 10,0.5,10);
    rect(this.x + 10,this.y + 10,0.5,10);
};
guy.prototype.move = function() {
    if(keyIsPressed && keys[RIGHT] && this.x + 25 < 400){
        this.x += 3;
    }
    if(keyIsPressed && keys[LEFT] && this.x - 25 > 0){
        this.x -= 3;
    }
};
var magnobot = new guy(200,270);

//Iron
var iron = function(x,y,yChange){
    this.x = x;
    this.y = y;
    this.yChange = yChange;
};
iron.prototype.draw = function(iron){
    fill(55);
    rect(iron.x,iron.y,20,10);
};
iron.prototype.fall = function(){
    //Falling Iron
    timer ++;

    //More Iron
    if(timer % multiply === 0){
        var moreIron = new iron(random(50,350),40,speed);
        pieces.push(moreIron);
    }
    for(var i = 0; i < pieces.length; i++){
        var thisIron = pieces[i];
        this.draw(thisIron);
        thisIron.y += thisIron.yChange;
        if(thisIron.y > 310){
            pieces.splice(i,1);
        }

        //Collision
        if(magnobot.x - 25 < thisIron.x && magnobot.x + 25 > thisIron.x && magnobot.y - 10 < thisIron.y && magnobot.y + 50 > thisIron.y){
            score++;
            pieces.splice(i,1);
        }
    }
};
var good = new iron();

draw = function() {
    //Clicking
    mouseClicked = function(){
        clicked = true;
    };

    //Scenes
    switch(scene){
        case 'Menu':{
            //Background
            noStroke();
            background(40);
            warMachine();

            //Title
            fill(255);
            textFont(createFont("Impact"));
            textAlign(CENTER,CENTER);
            textSize(50);
            text("WAR MACHINE",200,50);
            textSize(20);
            text("THE BIRTH OF A BRAND NEW AVENGER",200,85);//}

            //Buttons
            button(205,200,80,30,"PLAY","Game");
            button(205,300,80,30,"HOW","Instructions");
        }
        break;

        case 'Game':{
            //Background
            noStroke();
            background(20);
            for(var i = 2;i < 400;i += 80){
                fill(100);
                rect(i,0,78,400);
                rect(i,0,80,40);
            }
            fill(61, 17, 0);
            rect(0,320,400,80);
            fill(0);
            rect(40,0,320,40);
            fill(255);
            textSize(40);
            text("IRON DROPPER",200,20);

            //Falling Iron Pieces
            good.fall();

            //Magno-bot
            magnobot.draw();
            magnobot.move();

            //Score
            textSize(50);
            text("SCORE:" + score,200,200);

            //Timer
            fill(255,100);
            rect(20,345,360,30,10);
            fill(0, 255, 255);
            rect(25,349,limit/2,22,10);
            fill(0,0,255);
            textSize(25);
            text("TIMER",200,360);
            limit -= 0.5;
            if(limit <= 0){
                scene = 'Over';
            }
        }
        break;

        case 'Instructions':{
            //Background
            background(40);
            warMachine();
            fill(0,200);
            rect(0,0,400,400);

            //Instructions
            fill(0, 145, 255);
            textSize(10);
            text("Arrow Keys to Scroll...",55,scroll - 210);
            textSize(50);
            text("INSTRUCTIONS",200,scroll - 170);
            textSize(25);
            text("You are Tony Stark and all the\n Avengers have lost except you. The\n only way you can win against Thanos\n is by building the WAR MACHINE, but\n you are short of iron so take your\n Magno-bot and collect as much iron\n as possible. You will be taken to Iron\n Ore Land, Outer Core. Don't forget your\n arrow keys or else you can't operate\n the bot!",200,scroll + 10);

            //Scrolling
            if(keyIsPressed && keys[UP]){
                scroll++;
            }
            if(keyIsPressed && keys[DOWN]){
                scroll--;
            }

            //Buttons
            button(355,scroll + 200,80,27,"BACK","Menu");

        }
        break;

        case 'Over':{
            //Background
            background(40);
            warMachine();
            fill(0,200);
            rect(0,0,400,400);

            //Title
            fill(0, 145, 255);
            textSize(60);
            text("GAME OVER",200,40);

            //Message
            textSize(25);
            text("OK, We have less time in hand now... You gotta start building now. You have " + score + " blocks of Iron in hand, now press the spin off button and post in the T&T to start. All the best!",0,0,400,400);
        }
        break;
    }

    //Reset
    clicked = false;
};

void setup()
{
  size(400,400);
  background(255,255,255);
  noStroke();
  //fill(255);
  //noLoop();
}