var tanpow = 200;
var r = random(0,255);
var g = random(0,255);
var b = random(0,255);
var flag=0;
draw = function() {
    background(mouseX, mouseY, mouseY);

    fill(r, g, b);
    ellipse(tanpow,200,mouseX,mouseY);
    if (tanpow >= 50 && tanpow <51) {
        flag = 0;
    }
    if(flag === 0){
        tanpow++;
    }

    if(tanpow === 300) {
        flag = 1;
    }
    if(flag === 1){
        tanpow = tanpow -4;
    }
    if ( flag >= 2 && tanpow === 20) {
        tanpow = tanpow + 1;
        flag++;
}
};


void setup()
{
  size(400,400);
  background(255,255,255);
  //fill(255);
  //noLoop();
}