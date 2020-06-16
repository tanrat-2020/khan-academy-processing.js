/****************************************************************************************
 -----------------------------Jarpletz's Platformer Engine---------------------------

    Hello and welcome to Jarpletz's Platformer Engine! Arrow keys or WASD to move. Please note this is not a full game, but a demonstration of my platformer engine, which will be used to make full games in the (not so distant) future!

*Sorry the graphics aren't great, they're just some pixel arts I slapped together in an hour.

*** Please feel free to contact me in the T&T if your're interested in making your own platformer with my Engine!

***What type of games do you want to see me create with my platformer engine? let me know in the T&T!

@SUB_HERE:
If you want to get notified when I release some of my epic games, please feel free to 'sub' here:

https://www.khanacademy.org/computer-programming/subscribe-to-jarpletz/64369388778dw45504

@About:
Some facts about my Platformer Engine:
-it uses a simplified version of Agent X's loading system to display complex object graphics with the same amount of computing power as a single rectangle
-it only generates the blocks that are currently appearing on the canvas to reduce lag
-it smoothly transitions between moving the background to moving the player to prevent pixels beond the edges of the map from being shown.
-it is versitle and can easily utilize a wide variety of block textures and obstacle types

****************************************************************************************//*
_______________________________________CREDITS:_________________________________________

-Thanks to Agent X for the loading system. I use a simplified version of his own loading system.

-Credit to Joseph Barry's platformer template. Level display, Player collision, and player friction is based off his code.

- All code, graphics, and gameplay written and designed by Jarpletz, except for what was mentioned before this, which has been modified for my own use.

******************************************************************************************/


/*If you are making your own platformer, do not remove the next line or you will be commiting plagiarism:

All code, player movement, and gameplay features have been written by Jarpletz using Jarpletz's Platformer Engine:
*/

var playerCam=true;
var blockSize=25;
var pxlSize=blockSize/15;
var level=0;
var gendist=500;
var blocks=[];
var Player=[];
var enemies=[];
var traps=[];
var checkpoints=[];
var portals=[];
var keys=[];
var spawn=[];
var physblocks=[];
var sprites=[];
var bullets=[];
var blockers=[];
var turrets=[];
var drawLevels;
var drawNewLevel;
var levelH;
var levelW;
var transX;
var transY;



var gravity=new PVector(0,0.2);
var jumpForce=new PVector(0,-(blockSize/10));
var friction= new PVector(-0.05,0);

smooth();
//loading system (adapted from Agent X) {
var textures=[

    /*blank texture
    [
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',],*/

    [//grass
    '161611616116161',
    '101116111601606',
    '300611016001020',
    '002026303204003',
    '020003000003200',
    '003002003000300',
    '040000400020040',
    '020200040500200',
    '000303020020002',
    '030220030400320',
    '030005000003040',
    '002040203000200',
    '040030200205003',
    '002200040003300',
    '000302000302040',],
    [//dirt
    '000300203000300',
    '002050400204002',
    '300004000300020',
    '002020303204003',
    '020003000003200',
    '003002003000300',
    '040000400020040',
    '020200040500200',
    '000303020020002',
    '030220030400320',
    '030005000003040',
    '002040203000200',
    '040030200205003',
    '002200040003300',
    '000302000302040',],
    [//stone
    '000300203000300',
    '002050400204002',
    '300004000300020',
    '002020303204003',
    '020003040003202',
    '003002003000300',
    '040030400020040',
    '0202020040500200',
    '200303020020002',
    '030220030400320',
    '030005000003040',
    '4002040203000200',
    '340030200205003',
    '002200040003300',
    '050302000302040',],
    [//brick
    '040000200213002',
    '000200002010200',
    '111111111111111',
    '000004013333020',
    '400200013020000',
    '000004013000200',
    '040020010002000',
    '111111111111111',
    '000133333400000',
    '040132402040200',
    '000130002000004',
    '000104000022000',
    '111111111111111',
    '000020000013333',
    '040200000013020',
    ],
    [//wood
    '040000200213002',
    '000200002010200',
    '111111111111111',
    '000004013333020',
    '400200013020000',
    '000004013000200',
    '040020010002000',
    '111111111111111',
    '000133333400000',
    '040132402040200',
    '000130002000004',
    '000104000022000',
    '111111111111111',
    '000020000013333',
    '040200000013020',
    ],
    [//leaf
    '0 02011 0  1001',
    ' 10 0 102011 00',
    '0 1 000 1 20 0 ',
    '0 01 021 0 0101',
    ' 0 120 1 01 0 1',
    '1 20 01 10 10 0',
    ' 01 1 00 0 0 02',
    '20 0 01 0 0 1 0',
    '11 0 0 0 102 0 ',
    '0 001 11 01 010',
    ' 10 0 0 020 1 0',
    '0  0110 0 10100',
    ' 1020 010 00  0',
    '0 10 0 0 11 10 ',
    ' 0 00 102  2010',],
    [//log
    '000002020002000',
    '201200020002100',
    '201201020202102',
    '202201010200102',
    '201001010000202',
    '001100000020002',
    '012100100200200',
    '200102010220010',
    '001020101200010',
    '101000101001011',
    '101020101001201',
    '110120101102201',
    '010102001020201',
    '010102002120100',
    '000001001020001',],
    [//jump through
    '113211213211213',
    '231131233112311',
    '113112131311212',
    '121312321131213',
    '310011200121001',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',
    '000000000000000',],
    [//falling
    '006002660602602',
    '261260060062160',
    '601261020266102',
    '202266010260102',
    '206006010606202',
    '061106006620602',
    '0121661062600600',
    '200660066260660',
    '0060261061260060',
    '106006601061016',
    '161620166061201',
    '110120162106201',
    '016102601620601',
    '010606005220600',
    '000001001020001',],
    [//lava
    '000300203000300',
    '002050400204002',
    '300004000300020',
    '002020303204003',
    '020003000003200',
    '003002003000300',
    '040000400020040',
    '020200040500200',
    '000303020020002',
    '030220030400320',
    '030005000003040',
    '002040203000200',
    '040030200205003',
    '002200040003300',
    '000302000302040',],
    [//spike
    '       0       ',
    '      102      ',
    '      040      ',
    '     00001     ',
    '     20300     ',
    '    1204001    ',
    '    3000302    ',
    '   301234004   ',
    '   000000003   ',
    '  20004030003  ',
    '  102003002030  ',
    ' 4030300020100 ',
    ' 1000020303001 ',
    '100300032001001',
    '400030020002002',],
     [//crusher
    '040040310030040',
    '030400111004000',
    '003000101030300',
    '040001121100400',
    '000401020140030',
    '003011020113040',
    '040013023010030',
    '030110000011000',
    '000103020301003',
    '401100020001100',
    '001111111111140',
    '040030400003030',
    '               ',
    '               ',
    '               ',],
    [//crate
    '2222222222222',
    '2200000000022',
    '2020000000202',
    '2112111112112',
    '2000200020002',
    '2000020200002',
    '2111112111112',
    '2000020200002',
    '2000200020002',
    '2112111112112',
    '2020000000202',
    '2200000000022',
    '2222222222222',],
    ];
var imgs = {
   grass:{
    draw:function(){
      for(var i=0; i<textures[0].length; i++){
    for(var j=0; j< textures[0].length; j++){
        noStroke();
        switch(textures[0][j][i]){
        case "0":
        fill(128, 103, 38);
        stroke(128, 103, 38);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "1":
            fill(43, 194, 43);
            stroke(43, 194, 43);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "2":
            fill(171, 144, 82);
            stroke(171, 144, 82);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "3":
            fill(122, 111, 39);
            stroke(122, 111, 39);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
            fill(102, 93, 39);
            stroke(102, 93, 39);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "5":
            fill(84, 79, 62);
            stroke(84, 79, 62);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "6":
            fill(57, 166, 40);
            stroke(57, 166, 40);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   dirt:{
    draw:function(){
      for(var i=0; i<textures[1].length; i++){
    for(var j=0; j< textures[1].length; j++){
        noStroke();
        switch(textures[1][j][i]){
        case "0":
        fill(128, 103, 38);
        stroke(128, 103, 38);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "2":
            fill(171, 144, 82);
            stroke(171, 144, 82);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "3":
            fill(122, 111, 39);
            stroke(122, 111, 39);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
            fill(102, 93, 39);
            stroke(102, 93, 39);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "5":
            fill(84, 79, 62);
            stroke(84, 79, 62);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   stone:{
    draw:function(){
      for(var i=0; i<textures[2].length; i++){
    for(var j=0; j< textures[2].length; j++){
        noStroke();
        switch(textures[2][j][i]){
        case "0":
        fill(176, 176, 176);
        stroke(176, 176, 176);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "2":
            fill(158, 158, 158);
            stroke(158, 158, 158);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "3":
            fill(173, 173, 173);
            stroke(173, 173, 173);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
            fill(189, 189, 189);
            stroke(189);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "5":
            fill(214, 214, 214);
            stroke(214);
            rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   brick:{
    draw:function(){
    for(var i=0; i<textures[3].length; i++){
    for(var j=0; j< textures[3].length; j++){
        noStroke();
        switch(textures[3][j][i]){
        case "0":
        fill(181, 181, 181);
        stroke(181);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "1":
        fill(128, 128, 128);
        stroke(128);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "2":
        stroke(163);
        fill(163, 163, 163);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "3":
        fill(212);
        stroke(212, 212, 212);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
        stroke(153);
        fill(153, 153, 153);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   brickback:{
    draw:function(){
    for(var i=0;i<width/blockSize; i++){
    for(var j=0; j<width/blockSize; j++){
    image(imgs.brick, i*blockSize, j*blockSize);
    }
    }
    fill(0,0,0,60);
    noStroke();
    rect(0,0,width,height);
    },
    x:0,
    y:0,
    width:width,
    height:height
   },
   wood:{
    draw:function(){
   for(var i=0; i<textures[4].length; i++){
    for(var j=0; j< textures[4].length; j++){
        noStroke();
        switch(textures[4][j][i]){
        case "0":
        fill(189, 177, 102);
        stroke(186, 168, 108);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "1":
        fill(171, 165, 127);
        stroke(171, 165, 127);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "2":
        fill(201, 189, 145);
        stroke(201, 189, 145);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "3":
        fill(219, 219, 178);
        stroke(219, 219, 178);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
        fill(199, 199, 163);
        stroke(199, 199, 163);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }
    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   leaf:{
    draw:function(){
   for(var i=0; i<textures[5].length; i++){
    for(var j=0; j< textures[5].length; j++){
        noStroke();
        switch(textures[5][j][i]){
        case "1":
        fill(38, 189, 60);
        stroke(38, 189, 60);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "2":
        fill(0, 255, 43);
        stroke(0, 255, 43);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;


        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   log:{
    draw:function(){

    for(var i=0; i<textures[6].length; i++){
    for(var j=0; j< textures[6].length; j++){
        noStroke();
        switch(textures[6][j][i]){
        case "0":
        fill(150, 119, 66);
        stroke(150, 119, 66);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "1":
        fill(191, 162, 111);
        stroke(173, 140, 79);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "2":
        fill(209, 185, 151);
        stroke(150, 122, 81);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   lava:{
    draw:function(){

    for(var i=0; i<textures[9].length; i++){
    for(var j=0; j< textures[9].length; j++){
        noStroke();
        switch(textures[9][j][i]){
        case "0":
        fill(255, 20, 20);
        stroke(255, 20, 20);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "2":
        fill(255, 117, 71);
        stroke(255, 117, 71);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "3":
        fill(212, 0, 0);
        stroke(212, 0, 0);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "4":
        fill(191, 61, 61);
        stroke(191, 61, 61);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "5":
        fill(122, 39, 39);
        stroke(122, 39, 39);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   spike:{
    draw:function(){

    for(var i=0; i<textures[10].length; i++){
    for(var j=0; j< textures[10].length; j++){
        noStroke();
        switch(textures[10][j][i]){
        case "0":
        fill(184, 184, 184);
        stroke(184);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "1":
        fill(161, 161, 161);
        stroke(161);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "2":
        fill(125, 123, 125);
        stroke(125);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "3":
        fill(173, 173, 173);
        stroke(173);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
        fill(133, 133, 133);
        stroke(84);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize+2,
    height:blockSize
   },
   press:{
    draw:function(){
        for(var i=0; i<textures[11].length; i++){
    for(var j=0; j< textures[11].length; j++){
        noStroke();
        switch(textures[11][j][i]){
        case "0":
        fill(161, 161, 161);
        stroke(161);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "1":
        fill(255, 238, 0);
        stroke(255, 238, 0);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "2":
        fill(0);
        stroke(0);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "3":
        fill(166, 166, 166);
        stroke(166);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "4":
        fill(153, 153, 153);
        stroke(153);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }

    },
    x:0,
    y:0,
    width:blockSize+2,
    height:blockSize
   },

   jumpthrough:{
    draw:function(){
   for(var i=0; i<textures[7].length; i++){
    for(var j=0; j< textures[7].length; j++){
        noStroke();
        switch(textures[7][j][i]){
        case "1":
        fill(153, 121, 61);
        stroke(153, 121, 61);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "2":
        fill(201, 186, 113);
        stroke(201, 186, 113);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "3":
        fill(173, 151, 62);
        stroke(173, 151, 62);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   falling:{
    draw:function(){
   for(var i=0; i<textures[8].length; i++){
    for(var j=0; j< textures[8].length; j++){
        noStroke();
        switch(textures[8][j][i]){
        case "0":
        fill(189, 151, 85);
        stroke(189, 151, 85);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
        case "1":
        fill(189, 149, 79);
        stroke(189, 149, 79);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;
         case "2":
        fill(173, 140, 95);
        stroke(173, 140, 95);
        rect(i*pxlSize,j*pxlSize,pxlSize,pxlSize);
        break;

        }

    }
    }


    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   crate:{
    draw:function(){
     for(var i=0; i<textures[12].length; i++){
    for(var j=0; j< textures[12].length; j++){
        var pxlsiz=blockSize/13;
        noStroke();
        switch(textures[12][j][i]){
        case "0":
        fill(219, 202, 138);
        stroke(219, 202, 138);
        rect(i*pxlsiz,j*pxlsiz,pxlsiz,pxlsiz);
        break;
         case "1":
        fill(214, 186, 109);
        stroke(214, 186, 109);
        rect(i*pxlsiz,j*pxlsiz,pxlsiz,pxlsiz);
        break;
         case "2":
        fill(184, 167, 107);
        stroke(184, 167, 107);
        rect(i*pxlsiz,j*pxlsiz,pxlsiz,pxlsiz);
        break;

        }
    }
    }
    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },
   speedright : {
   draw: function(){

 noStroke();
    fill(153, 153, 153,150);
    rect(0,0+blockSize*0.4, blockSize,blockSize*0.6);
    fill(209, 222, 27);
    beginShape();
    vertex(0,0+blockSize*0.4);
    vertex(0+blockSize*0.2,0+blockSize*0.4);
    vertex(0+blockSize*0.4,0+blockSize*0.7);
    vertex(0+blockSize*0.2,0+blockSize);
    vertex(0,0+blockSize);
    vertex(0+blockSize*0.2,0+blockSize*0.7);
    endShape();
    beginShape();
    vertex(0+blockSize*0.3,0+blockSize*0.4);
    vertex(0+blockSize*0.5,0+blockSize*0.4);
    vertex(0+blockSize*0.7,0+blockSize*0.7);
    vertex(0+blockSize*0.5,0+blockSize);
    vertex(0+blockSize*0.3,0+blockSize);
    vertex(0+blockSize*0.5,0+blockSize*0.7);
    endShape();
    beginShape();
    vertex(0+blockSize*0.6,0+blockSize*0.4);
    vertex(0+blockSize*0.8,0+blockSize*0.4);
    vertex(0+blockSize,0+blockSize*0.7);
    vertex(0+blockSize*0.8,0+blockSize);
    vertex(0+blockSize*0.6,0+blockSize);
    vertex(0+blockSize*0.8,0+blockSize*0.7);
    endShape();
   },
   x:0,
   y:0,
   width: blockSize,
   height:blockSize
  },
   speedleft: {
   draw: function(){
      noStroke();
    fill(153, 153, 153,150);
    rect(0,0+blockSize*0.4, blockSize,blockSize*0.6);
    fill(209, 222, 27);
    beginShape();
    vertex(0+blockSize*0.4,0+blockSize*0.4);
    vertex(0+blockSize*0.2,0+blockSize*0.4);
    vertex(0,0+blockSize*0.7);
    vertex(0+blockSize*0.2,0+blockSize);
    vertex(0+blockSize*0.4,0+blockSize);
    vertex(0+blockSize*0.2,0+blockSize*0.7);
    endShape();
    beginShape();
    vertex(0+blockSize*0.7,0+blockSize*0.4);
    vertex(0+blockSize*0.5,0+blockSize*0.4);
    vertex(0+blockSize*0.3,0+blockSize*0.7);
    vertex(0+blockSize*0.5,0+blockSize);
    vertex(0+blockSize*0.7,0+blockSize);
    vertex(0+blockSize*0.5,0+blockSize*0.7);
    endShape();
    beginShape();
    vertex(0+blockSize,0+blockSize*0.4);
    vertex(0+blockSize*0.8,0+blockSize*0.4);
    vertex(0+blockSize*0.6,0+blockSize*0.7);
    vertex(0+blockSize*0.8,0+blockSize);
    vertex(0+blockSize,0+blockSize);
    vertex(0+blockSize*0.8,0+blockSize*0.7);
    endShape();

   },
   x:0,
   y:0,
   width: blockSize,
   height:blockSize
  },
   speedup: {
   draw: function(){
    noStroke();
    fill(153, 153, 153,150);
    rect(0+blockSize*0.2,0, blockSize*0.6,blockSize);
    fill(209, 222, 27);
    beginShape();
    vertex(0+blockSize*0.2,0+blockSize*0.4);
    vertex(0+blockSize*0.2,0+blockSize*0.2);
    vertex(0+blockSize*0.5,0);
    vertex(0+blockSize*0.8,0+blockSize*0.2);
    vertex(0+blockSize*0.8,0+blockSize*0.4);
    vertex(0+blockSize*0.5,0+blockSize*0.2);
    endShape();
    beginShape();
    vertex(0+blockSize*0.2,0+blockSize*0.7);
    vertex(0+blockSize*0.2,0+blockSize*0.5);
    vertex(0+blockSize*0.5,0+blockSize*0.3);
    vertex(0+blockSize*0.8,0+blockSize*0.5);
    vertex(0+blockSize*0.8,0+blockSize*0.7);
    vertex(0+blockSize*0.5,0+blockSize*0.5);
    endShape();
    beginShape();
    vertex(0+blockSize*0.2,0+blockSize);
    vertex(0+blockSize*0.2,0+blockSize*0.8);
    vertex(0+blockSize*0.5,0+blockSize*0.6);
    vertex(0+blockSize*0.8,0+blockSize*0.8);
    vertex(0+blockSize*0.8,0+blockSize);
    vertex(0+blockSize*0.5,0+blockSize*0.8);
    endShape();
   },
   x:0,
   y:0,
   width: blockSize,
   height:blockSize
  },
   saw : {
   draw: function(){
    for(var i=0; i<30; i++){
     pushMatrix();
     translate(blockSize*1.5,blockSize*1.5);
     rotate(i*12);
     fill(184, 184, 184);
     triangle(-7,0,7,0,0,blockSize*1.5);
     popMatrix();
    }
   },
   x:0,
   y:0,
   width:blockSize*3,
   height:blockSize*3
  },
   portal: {
    draw: function(){
    fill(255);
    noStroke();
    ellipse(blockSize/2,blockSize/2,blockSize-2,blockSize-2);


    var theta=0;
    for(var r=0; r<11.4; r+=0.008){
    strokeWeight(0.1);
    stroke(0);

    pushMatrix();
    translate(blockSize/2,blockSize/2);
    point(r * cos(theta),r * sin(theta));
    popMatrix();
    theta+=0.5;
    }

    },
    x:0,
    y:0,
    width:blockSize,
    height:blockSize
   },

};
var loadIndex=-1;
var doneLoad=false;
var loadImgs=function(){
  if(loadIndex< Object.keys(imgs).length-1){
    loadIndex++;

    background(0,0,0,0);
    imgs[Object.keys(imgs)[loadIndex]].draw();

     imgs[Object.keys(imgs)[loadIndex]] = get(imgs[Object.keys(imgs)[loadIndex]].x, imgs[Object.keys(imgs)[loadIndex]].y, imgs[Object.keys(imgs)[loadIndex]].width, imgs[Object.keys(imgs)[loadIndex]].height);
  }
  else{
   doneLoad=true;
  }
    background(0);
    fill(255);
    textSize(40);
    text("Loading...",150,250);
};
//}

var levels=[
    /*blank level:(for blockSize=25 [
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        'GGGGGGGGGGGGGGGG',
        ],

        Key:

        P-player spawn- one per level
        @-portal- one per leve
        C-checkpoint- as many as you want, but they're two blocks high so put it in the block above the block you want it to be in... trust me

        Blocks:
        B-brick
        G-grass
        D-dirt
        W-wood
        L-leaf
        T-log
        R-rock (stone)

        Sprites:
        b-brick
        g-grass
        d-dirt
        w-wood
        l-leaf
        t-log
        r-rock (stone)

        Obstacles:
        s-spike
        !- turret
        E-enemy
        e-enemy blocker
        -- lava
        +-saw
        ! press

        Special Blocks:
        ~-water
        =-ladder
        >/</^- boost pad (arrow specifies direction)
        #-falling block
        _-jump through block
        &- movable block

        Combos: (created for my needs)

        S- spike+stone sprite
        X- Enemy + stone Sprite
        x- blocker + stone sprite
        3- falling + stone sprite
        `- jump through + stone sprite
        2-portal+ stone sprite
        c-checkpoint+stone sprite
    */
    [
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '                ',
        '  P            @',
        'GGGGGGGGGGGGGGGG',
        ],
    [
'                                                   GGGGGGGGGGGGGGGGGGGGGGGGGGG',
'                 LLL                                 DDDDDDDRRRDDDDDDDDRRDDDRD',
'                LLLLL                                 C DDDDRRRRRRRRRRRRRRRRRR',
'               lLLLLLl                                  rrrrrrrrrrrrrrrrRRRRRR',
'              lLLlLLLl                             ~~~RrrrrrrrrrrrrrrrrrrrRRRR',
'R            llLTLLTLllL                           ~DRRRRRRrrrrrrrrrrrrrrrRRRR',
'RR          LllLLTLlLllL                          ~~DRRRRrrrrrrrrrrrRrrrrrrRRR',
'RRr        LLllLLLTLLllLL                         ~RRRRRrrrrrrrrrrrRrrrrrrrrRR',
'RRrr      LLWwwTLLTLLllLL                         ~RRRRRrrrrrrRrrrrRrrrRrrrrrR',
'RRrrR    LLLWlllWLLlLlLLLL      L                ~~RRRRRRrrrrrRrrrrRrrrrrrrrrR',
'RRrrR     LLW P lWLLLltTLL     LLL               ~DRRRRRRSSSSSRSSSSRSSrrrrrrrR',
'RRRrR      LTTTTtW LLTllLL    LLLLL              ~DRRRrRRRRRRRRRRRRRRRrrrrrrRR',
'RRRrr       LLL =TLLTLL        LTL               ~RRRRRRRRRRRRRRrrrrrrrrrrrrRR',
'RRRRr           = TT            T               ~~RRRRRRRRrRRRRRrrrrrrxXrrrrRR',
'RRRRR           = TT            T              ~~DRRRRRRRRRRRrrrrrrrrrrRRRRRRR',
'RRRRRR  T F T   = tt    GGGDGGGGGGGGGGG        ~DRRRRRRRRRRrrrrrrrrrrrRRRRRRRR',
'RRRRGGGGDDDDDGGGGGDDGGGGDDDDDDDDDdDDDDDDGGG~~~~~RRRRRRrrrrrrrrrrrSSrrrRrrrrrrR',
'RRRRRDDDDDDDDdDDDDDDDDDdDDDDDdDDdDDDDDDDDDDDDDDDDRRDRRrrrrrrRRRRRRRRRRrrrrrrrR',
'RRRRRRDDdRDRRDDDDdDDDRRDDdDDDdDDDDdDDDDDdRDRRRRRRRRRRRrrrrrrrrrrrrrrrrrrrrrrrR',
'RRRRRRRRRRRRRRRRRRRrRRRRRRRRRRRRRRRRDRRRRRRRRRRRRRRRRRXrrrrrrrrXrrrrXxrrrSSrrR',
'RrrrrrrrrrrrrrrrrrrrrrrrrRRRRRRRRRRRRRrrrrrrrrrrrrrrRRRRRRRRRRRRRRRRRRRRRRRrrR',
'R2rrrrrrrrrrrrrrrrrrrrrrrrRRRrRRRRRRRrrrrrrrrrrrrrrrrrrrrrrRRRRRrrrrrrrrrrrrrR',
'RRRRrrrrrrrrrrrrrrrrrrrrrrrRRRRRrRRrrrrrrrr3rr3rrrrrrrrrrrrrRRRrrrrrrrrrrrrrrR',
'RrrrrrrrRrrrrrrrrrrrrrrrrrrrRRRRRRrrrrrrrR----rrrrrrrrrrrrrrrRRrrrrrrrrrrrrrrR',
'RrrrrrrrrrrrrrrrrrrRrXrrrXrrrRRRRrrrrrrrrrRRR-rrrrRrrrrrrrrrrrRrrrrrrSSrrrSrrR',
'RrrrRrrrrrrrrrR----RrrrrrrrrrrrRRrrxrrXrrrXrx-rrrrrrrrrrrrrrrrRSrrSRRRRRRRRRRR',
'RrrrrRrrrrrrrrrRRR-r```````````rrrrrRRRRRRRRr-RrrrrrrrrrrrrrrrRRrrRRRRrRRRRRRR',
'-rrrrrrrrRrrrrrRRR-rrrrrrrrrrrrrrrrrrrrrrrrrr-rrrrrrrrrrrrrrrrcrrrRRRRRRRRRRRR',
'R-rrrrrrSRSSSSSRRR-RRRRRRRRRRRRrXrrrXrrXxrrrr-33rrr33rrrRrSrrrrrrrRRRRRRRRrRRR',
'R-------RRRRRRRRRR-----------RRRRRRRRRRRR---------------RRRRRRRRRRRRRRRRRRRRRR'],
    [
'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB',
'B<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<         >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>B',
'B BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB_________BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB B',
'B B                                   B                                          B B',
'B B                                   B   ^  <<<<<<                              B B',
'B B                         BBBBBBBBBBBBBBBBBBBBBBBBBBBB                         B B',
'B B                         B                  III    B    B                     B B',
'B B                         B    B                    B                          B B',
'B B                         B    B           &BBBBB___B  B                       B B',
'B B                         B    B     &    &&B   B   B                          B B',
'B B                +        B    BBBBBBBBBBBBBB   B   BB                 BB      B B',
'B B                         B    II  II  I  B     B   B           ^^^    !       B B',
'B B P                       B               B     B   BBBBBB   +             B   B B',
'B BBBBBBBBB+BBBB+BBBBBB     BBBBBBBBBBBBBB  B     B^^^B    B                     B B',
'B B                         B               B              B                   B B B',
'B B                         B   BBBBBBBBBBBBB   BBB___BBB  B                     B B',
'B B                         B     II   II  II   BBB   B B  B          BB     &   B B',
'B B             +<<<<<<<<<<<B   &               BBB   B B  B  B +BB         BBBBBB B',
'B B              BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB   BBB  B                     B B',
'B B              B<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<B  BB                   BB B',
'B B  B           B BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB___B B  B B         BBB       B B',
'B B  B           B B!        !         !       !B     B B  B+    BB          BB  B B',
'B B  BB         BB B                            B     B B  B                       B',
'B B  B           B B                             C  ^^B B  B             BB        B',
'B B  B B       B B B    BB                          ^^B B  B!                    ! B',
'B B  B     B  B  B BB          B                BBBBBBB^B  B           B           B',
'B B  B+++++++++++<<B               BBB         BB>>>>>>^B C     BB                 B',
'B B  BBBBBBBBBBBBBBB   B                        B BBBBBBB            B             B',
'B B                        B              BB    B B     BBBBBB                     B',
'B BC                                            B^                                 B',
'B B  >>>>>>>>>>>>      B                        B^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<B',
'B@BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB',],
   [
        '                                                        ',
        '                                                        ',
        '                                                        ',
        '                       @                                ',
        '                                                        ',
        '                                                        ',
        '                                                        ',
        '                                                        ',
        '                                      e   E         e   ',
        '                               #######_______________<< ',
        '                                                     << ',
        '                                                     << ',
        '                                                     << ',
        '                                                        ',
        '                                    !                   ',
        '         ~~                                             ',
        '   BWLTRGD~      =                                      ',
        '   bwltrgd~    C =            I                       ^ ',
        ' P        ~      =   F   s                   &     B  ^ ',
        'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB+BBBB--BBBBBBBBBBBBBB',]
    ];


var checkIn=function(x,y,w,h,X,Y,W,H){
 if(x+w>X && x<X+W && y+h>Y && y<Y+H){
     return true;
 }
};
var runObj=function(object){
    for(var i=0; i<object.length;i++){
    if(object[i].x+object[i].width>-transX && object[i].x<-transX+width && object[i].y+object[i].height>transY && object[i].y<-transY+height ){
     object[i].run();
    }
    }
};
var runSpecial=function(object){
   for(var i=0; i<object.length;i++){
    if(dist(Player[0].pos.x,Player[0].pos.y,object[i].pos.x,object[i].pos.y)<gendist){
     object[i].run();
    }
    }
};
var resetStats=function(){
  for(var i=0; i<enemies.length; i++){
    enemies[i].pos.set=(enemies[i].orgX,enemies[i].orgY);
    enemies[i].health=100;
    enemies[i].alive=true;
  }
  for(var i=0; i<physblocks.length; i++){
      physblocks[i].collided=false;
      physblocks[i].acc.set(0,0);
      physblocks[i].vel.set(0,0);
      physblocks[i].x=physblocks[i].orgX;
      physblocks[i].y=physblocks[i].orgY;
  }

};

var player=function(x,y){
  this.pos=new PVector(x,y);
  this.vel=new PVector(0,0);
  this.acc=new PVector(0,0);
  this.width=blockSize-blockSize/3;
  this.height=blockSize-blockSize/3;
  this.health=100;
  this.onGround=false;
  this.speedpad=false;

player.prototype.draw= function() {
    fill(242, 214, 53);
    stroke(242, 214, 53);
    strokeWeight(1);
    rect(this.pos.x,this.pos.y,blockSize-blockSize/3,blockSize-blockSize/3,4);
    fill(0);
    noStroke();
    ellipse(this.pos.x+blockSize/4.5+this.vel.x/2,this.pos.y+blockSize/4+this.vel.y/2,blockSize/14,blockSize/8);
    ellipse(this.pos.x+blockSize/2.2+this.vel.x/2,this.pos.y+blockSize/4+this.vel.y/2,blockSize/14,blockSize/8);
    noFill();
    strokeWeight(1.5);
    stroke(0);
    arc(this.pos.x+blockSize/3+this.vel.x/2,this.pos.y+blockSize/2.4+this.vel.y/2,blockSize/4,blockSize/6, 31,143);
    if(this.health<100){
    fill(255, 0, 0);
    noStroke();
    rect(this.pos.x,this.pos.y-8,this.width, 2);
    fill(0, 255, 38);
    rect(this.pos.x,this.pos.y-8,(this.health/100)*this.width, 2);
    }
    };
this.applyForce= function(force){
    this.acc.add(force);
  };
this.update=function(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.set(0,0);
    if(this.speedpad===false){
    this.vel.x=constrain(this.vel.x,-blockSize/10,blockSize/10);
    }
    else if(this.speedpad===true){
    this.vel.x=constrain(this.vel.x,-blockSize/6,blockSize/6);
    }
    this.applyForce(gravity);
    if(keys[RIGHT]|| keys[68]){
     this.acc.add(0.2,0);
    }
    if(keys[LEFT]||keys[65]){
     this.acc.add(-0.2,0);
    }
    if((keys[87] || keys[UP]) && this.onGround===true){
     this.applyForce(jumpForce);
     this.onGround=false;
    }
    if(this.onGround===true){
     friction.set(-0.1,0);
    }
    if(this.onGround===false){
    friction.set(-0.07,0);
    }
    //friction{
    if(this.vel.x <friction.x) {
            this.vel.x -= friction.x;
        } else if(this.vel.x >-friction.x) {
            this.vel.x += friction.x;
        }   else{
            this.vel.x = 0;
        }

    if(this.health<1 || this.pos.y>levelH+300){
     background(255, 0, 0);
     this.vel.set(0,0);
     this.pos.set(spawn[level]);
     this.health=100;
     resetStats();
    }
    //}

  };
player.prototype.run=function(){
  this.update();
  this.draw();
};
};



var blocker=function(x,y){
  this.x=x;
  this.y=y;
  this.width=blockSize;
  this.height=blockSize;

};

var block=function(x,y,t){
  this.x=x;
  this.y=y;
  this.width=blockSize;
  this.height=blockSize;
  this.type=t;
  this.draw= function() {
      fill(55, 163, 47);
      stroke(77, 47, 158);
      strokeWeight(1);
     // rect(this.x,this.y,this.width,this.height);
      imageMode(CORNER);

      if(this.type==="stone"){
        image(imgs.stone,this.x,this.y);
      }
      if(this.type==="dirt"){
        image(imgs.dirt,this.x,this.y);
      }
      if(this.type==="grass"){
        image(imgs.grass,this.x,this.y);
      }
      if(this.type==="brick"){
       image(imgs.brick,this.x,this.y);
      }
      if(this.type==="leaf"){
       image(imgs.leaf,this.x,this.y);
      }
      if(this.type==="log"){
       image(imgs.log,this.x,this.y);
      }
      if(this.type==="wood"){
       image(imgs.wood,this.x,this.y);
      }
  };
  this.check=function(){
    if(checkIn(Player[0].pos.x,Player[0].pos.y,Player[0].width,Player[0].height,this.x,this.y,this.width,this.height)){

        if(Player[0].pos.x+Player[0].width>this.x+this.width/7 && Player[0].pos.x<this.x+this.width-this.width/7){
            //above
         if(Player[0].pos.y+Player[0].height<this.y+this.height/2){
            Player[0].onGround=true;
            Player[0].vel.y=0;
            Player[0].pos.y=this.y-(Player[0].height);
         }
         //below
         if(Player[0].pos.y>this.y+this.height/2){
            Player[0].vel.y=0;
            Player[0].pos.y=this.y+this.height;
         }



        }

        if(Player[0].pos.y+Player[0].height>this.y+this.height/7 && Player[0].pos.y<this.y+this.height-this.height/7){
            //left
         if(Player[0].pos.x+Player[0].width<this.x+this.width/2){
            Player[0].vel.x=0;
            Player[0].pos.x=this.x-(Player[0].width);
         }
         //right
         if(Player[0].pos.x>this.x+this.width/2){
            Player[0].vel.x=0;
            Player[0].pos.x=this.x+this.width;
         }
        }
    }

  };
  this.run=function(){
   this.draw();
   this.check();
  };
};

var sprite=function(x,y,t){
 this.x=x;
  this.y=y;
  this.width=blockSize;
  this.height=blockSize;
  this.type=t;

  this.draw= function() {
      imageMode(CORNER);

      if(this.type==="stone"){
        image(imgs.stone,this.x,this.y);

      }
      if(this.type==="dirt"){
        image(imgs.dirt,this.x,this.y);
      }
      if(this.type==="grass"){
        image(imgs.grass,this.x,this.y);
      }
      if(this.type==="brick"){
       image(imgs.brick,this.x,this.y);
      }
      if(this.type==="leaf"){
       image(imgs.leaf,this.x,this.y);
      }
      if(this.type==="log"){
       image(imgs.log,this.x,this.y);
      }
      if(this.type==="wood"){
       image(imgs.wood,this.x,this.y);
      }
      fill(0,0,0,60);
      noStroke();
     rect(this.x-1,this.y-1,this.width,this.height);
  };
  this.run=function(){
    this. d=dist(Player[0].pos.x,Player[0].pos.y,this.x,this.y);
   this.draw();
  };

};

var physicblock=function(x,y,t){
  this.orgX=x;
  this.orgY=y;
  this.x=this.orgX;
  this.y=this.orgY;
  this.width=blockSize;
  this.height=blockSize;
  this.vel=new PVector(0,0);
  this.acc=new PVector(0,0);
  this.t=t;
  this.collided=false;

  this.draw= function() {
      imageMode(CORNER);
    if(this.t==="water"){
    noStroke();
    fill(0, 136, 255,100);
    rect(this.x,this.y,this.width,this.height);
    }
    if(this.t==="speedRight"){
    imageMode(CORNER);
   image(imgs.speedright,this.x,this.y);
  }
    else if(this.t==="speedLeft"){
        imageMode(CORNER);
   image(imgs.speedleft,this.x,this.y);

  }
    else if(this.t==="speedUp"){
    imageMode(CORNER);
    image(imgs.speedup,this.x,this.y);
  }
    else{
    Player[0].speedpad=false;
    }
    if(this.t==="ladder"){
      stroke(189, 163, 30);
      strokeWeight(blockSize/5);
      line(this.x+this.width*0.2,this.y,this.x+this.width*0.2,this.y+this.height-3);
      line(this.x+this.width*0.8,this.y,this.x+this.width*0.8,this.y+this.height-3);
      strokeWeight(blockSize/6);
      line(this.x+2,this.y+this.height*0.3,this.x+this.width-2,this.y+this.height*0.2);
      line(this.x+2,this.y+this.height*0.7,this.x+this.width-2,this.y+this.height*0.8);
    }
    if(this.t==="falling"){
       image(imgs.falling,this.x,this.y);
    }
    if(this.t==="jumpthrough"){
      image(imgs.jumpthrough,this.x,this.y);
    }
    if(this.t==="moving"){

     image(imgs.crate,this.x,this.y);
    }
  };
  this.check=function(){
      this.vel.add(this.acc);
      this.acc.set(0,0);
      this.y+=this.vel.y;
      this.x+=this.vel.x;

    if(checkIn(Player[0].pos.x,Player[0].pos.y,Player[0].width,Player[0].height,this.x,this.y,this.width,this.height)){

     if(this.t==="water"){
      Player[0].vel.x=constrain(Player[0].vel.x,-0.5,0.5);
      Player[0].acc.y=constrain(Player[0].acc.y,-1,1);
      Player[0].vel.y=constrain(Player[0].vel.y,-0.5,0.5);
      Player[0].onGround=true;
     }
     if(this.t==="ladder"){
      Player[0].acc.y=constrain(Player[0].acc.y,-1,1);
      Player[0].vel.y=constrain(Player[0].vel.y,-0.5,1);
      Player[0].onGround=true;
     }
     if(this.t==="speedRight"){
       Player[0].speedpad=true;
       Player[0].acc.x+=1.5;
     }
     if(this.t==="speedLeft"){
       Player[0].speedpad=true;
       Player[0].acc.x-=1.5;
     }
     if(this.t==="speedUp"){
       Player[0].speedpad=true;
       Player[0].acc.y-=1.5;
     }
     if(this.t==="falling"){
        if(Player[0].pos.x+Player[0].width>this.x+this.width/7 && Player[0].pos.x<this.x+this.width-this.width/7){
            //above
         if(Player[0].pos.y+Player[0].height<this.y+this.height/2){
            this.collided=true;
            Player[0].onGround=true;
            Player[0].vel.y=0;
            Player[0].pos.y=this.y-(Player[0].height);
         }
         //below
         if(Player[0].pos.y>this.y+this.height/2){
            Player[0].vel.y=0;
            Player[0].pos.y=this.y+this.height;
         }



        }
        if(Player[0].pos.y+Player[0].height>this.y+this.height/7 && Player[0].pos.y<this.y+this.height-this.height/7){
            //left
         if(Player[0].pos.x+Player[0].width<this.x+this.width/2){
            Player[0].vel.x=0;
            Player[0].pos.x=this.x-(Player[0].width);
         }
         //right
         if(Player[0].pos.x>this.x+this.width/2){
            Player[0].vel.x=0;
            Player[0].pos.x=this.x+this.width;
         }



        }

     }
     if(this.t==="jumpthrough"){
         if(Player[0].pos.x+Player[0].width>this.x+this.width/7 && Player[0].pos.x<this.x+this.width-this.width/7 && Player[0].pos.y+Player[0].height<this.y+this.height/2){
             Player[0].onGround=true;
            if(Player[0].vel.y>0){
            Player[0].vel.y=0;
            }
            Player[0].pos.y=this.y-(Player[0].height);
         }
     }
     if(this.t==="moving"){
    if(Player[0].pos.x+Player[0].width>this.x+this.width/7 && Player[0].pos.x<this.x+this.width-this.width/7){
            //above
         if(Player[0].pos.y+Player[0].height<this.y+this.height/2){
            Player[0].onGround=true;
            Player[0].vel.y=0;
            Player[0].pos.y=this.y-(Player[0].height);
         }
         //below
         if(Player[0].pos.y>this.y+this.height/2){
            Player[0].vel.y=0;
            Player[0].pos.y=this.y+this.height;
         }



        }

        if(Player[0].pos.y+Player[0].height>this.y+this.height/7 && Player[0].pos.y<this.y+this.height-this.height/7){
            //left
         if(Player[0].pos.x+Player[0].width<this.x+this.width/2){
            Player[0].pos.x=this.x-(Player[0].width);
            if(Player[0].acc.x>0){
           this.acc.x=Player[0].acc.x;
            }
         }
         //right
         if(Player[0].pos.x>this.x+this.width/2){
            Player[0].pos.x=this.x+this.width;
         if(Player[0].acc.x<0){
           this.acc.x=Player[0].acc.x;
            }
         }



        }
     }
    }
    if(this.collided===true && this.y<levelH){
         this.acc.y+=0.03;
        }
    if(this.t==="moving"){
        //collision with blocks{
   for(var i=0; i<blocks.length; i++){
    if(checkIn(this.x,this.y,this.width,this.height,blocks[i].x,blocks[i].y,blocks[i].width,blocks[i].height)){

        if(this.x+this.width>blocks[i].x+blocks[i].width/7 && this.x<blocks[i].x+blocks[i].width-blocks[i].width/7){
            //above
         if(this.y+this.height<blocks[i].y+blocks[i].height/2){
            this.vel.y=0;
            this.y=blocks[i].y-(this.height);
         }
        }

        if(this.y+this.height>blocks[i].y+blocks[i].height/7 && this.y<blocks[i].y+blocks[i].height-blocks[i].height/7){
            //left
         if(this.x+this.width<blocks[i].x+blocks[i].width/2){
            this.vel.x=0;
           this.x=blocks[i].x-(this.width);
         }
         //right
         if(this.x>blocks[i].x+blocks[i].width/2){
            this.vel.x=0;
            this.x=blocks[i].x+blocks[i].width;
         }
        }
    }

   }
   //}
   //collision with other physic blocks{
   for(var i=0; i<physblocks.length; i++){
    if(checkIn(this.x,this.y,this.width,this.height,physblocks[i].x,physblocks[i].y,physblocks[i].width,physblocks[i].height)){

        if(this.x+this.width>physblocks[i].x+physblocks[i].width/7 && this.x<physblocks[i].x+physblocks[i].width-physblocks[i].width/7){
            //above
         if(this.y+this.height<physblocks[i].y+physblocks[i].height/2){
            this.vel.y=0;
            this.y=physblocks[i].y-(this.height);
         }
        }

        if(this.y+this.height>physblocks[i].y+physblocks[i].height/7 && this.y<physblocks[i].y+physblocks[i].height-physblocks[i].height/7){
            //left
         if(this.x+this.width<physblocks[i].x+physblocks[i].width/2){
            this.vel.x=0;
           this.x=physblocks[i].x-(this.width);
         }
         //right
         if(this.x>physblocks[i].x+physblocks[i].width/2){
            this.vel.x=0;
            this.x=physblocks[i].x+physblocks[i].width;
         }
        }
    }

   }
   //}
   //friction
        if(this.vel.x <friction.x) {
            this.vel.x -= friction.x;
        } else if(this.vel.x >-friction.x) {
            this.vel.x += friction.x;
        }   else{
            this.vel.x = 0;
        }
        this.acc.y+=gravity.y;
        this.vel.y=constrain(this.vel.y,-1,1);
    }
  };
  this.run=function(){
    this.draw();
    this.check();
  };
};

var bullet=function(x,y){
  this.pos=new PVector(x,y);
  this.vel=new PVector(Player[0].pos.x+Player[0].width/2-this.pos.x,Player[0].pos.y+Player[0].height/2-this.pos.y);
  this.vel.normalize();
  this.vel.mult(2);
  this.width=5;
  this.height=5;
  this.alive=true;

  this.draw= function() {
    noStroke();
    fill(59, 59, 59);
    ellipse(this.pos.x,this.pos.y,this.width,this.height);
  };
  this.update=function(){
    this.pos.add(this.vel);
     if(checkIn(Player[0].pos.x,Player[0].pos.y,Player[0].width,Player[0].height,this.pos.x,this.pos.y,this.width,this.height)){
      Player[0].health-=20;
      this.alive=false;
     }
      //collision with blocks{
   for(var i=0; i<blocks.length; i++){
    if(checkIn(this.pos.x,this.pos.y,this.width,this.height,blocks[i].x,blocks[i].y,blocks[i].width,blocks[i].height)){
       this.alive=false;
    }
   }
   //}

  };
  this.run=function(){
    if(this.alive===true){
     this.draw();
     this.update();
    }
  };
};
var turret=function(x,y){
     this.x=x;
     this.y=y;
     this.width=blockSize;
     this.height=blockSize;
     this.direction=new PVector(0,0);

  this.draw= function() {
      this. d=dist(Player[0].pos.x,Player[0].pos.y,this.x,this.y);
     fill(171, 171, 171);
     noStroke();
     rect(this.x,this.y,this.width,this.height);
     this.direction.set(Player[0].pos.x+Player[0].width/2,Player[0].pos.y+Player[0].height/2);
     this.direction.x-=this.x+this.width/2;
     this.direction.y-=this.y+this.height/2;
     this.direction.normalize();
     this.direction.mult(blockSize/2);
     pushMatrix();
     strokeWeight(5);
     translate(this.x+this.width/2,this.y+this.height/2);
     stroke(112, 112, 112);
     line(0,0,this.direction.x,this.direction.y);
     popMatrix();
  };
  this.shoot=function(){
      if(frameCount %60 ===0){
        bullets.push(new bullet(this.x+this.width/2,this.y+this.height/2));

      }
  };
  this.run=function(){
    this.draw();
    this.shoot();
  };
};

/*var lazar=function(x,y,d){
  this.x=x;
  this.y=y;
  this.width=blockSize;
  this.height=blockSize;
  this.d=d;
  this.beam=new PVector(x,103);

  this.draw= function() {
    if(this.d==="up"){
    stroke(247, 0, 255);
    strokeWeight(5);
    line(this.x+this.width/2,this.y+this.height,this.beam.x+this.width/2,this.beam.y);

  }

  };
  this.update=function(){

      if(this.d==="up"){
      for(var i=0; i<blocks.length; i++){
    if(this.beam.x>blocks[i].x && this.beam.x<blocks[i].x+blocks[i].width ){
            this.beam.y=blocks[i].y+blocks[i].height;
    }
    }
    }
  };
  this.run=function(){
      this.draw();
      this.update();
  };
};*///closed WIP failed attempt at creating lazers



var checkpoint=function(x,y){
    this.x=x;
    this.y=y;
    this.width=blockSize;
    this.height=blockSize*2;
    this.r=0;
    this.active=false;

    checkpoint.prototype.draw= function() {
     strokeWeight(4);
     stroke(181, 170, 105);
     line(this.x+this.width/2,this.y+this.height/2,this.x+this.width/2,this.y+this.height);
     pushMatrix();
     translate(this.x+this.width/2,this.y+this.height/2);
     rotate(this.r);
     line(0,-this.height/2,0,this.height/2);
     noStroke();
     if(this.r<540){
     fill(255, 0, 0);
     triangle(0,-this.height/2-2,0,-4,-this.width/2,-this.height/3);
     }
     if(this.r>180){
     fill(0, 255, 0);
    // triangle(0,-this.height/2-2,0,-4,-this.width/2,-this.height/3);
     }
     if(this.active===true){
     fill(0, 255, 0);
     triangle(0,this.height/2+2,0,4,this.width/2,this.height/3);
     }
     popMatrix();
    };
    checkpoint.prototype.check=function(){
        if(checkIn(Player[0].pos.x,Player[0].pos.y,Player[0].width,Player[0].height,this.x,this.y,this.width,this.height)){
        for(var i=0; i<checkpoints.length; i++){
         checkpoints[i].active=false;
        }
        this.active=true;
        }
        if(this.active===true){
        if(this.r<540){
         this.r+=20;
        }
        spawn[level].set(this.x,this.y+this.height/2);
        }
    };
    checkpoint.prototype.run=function(){
        this.draw();
        this.check();
    };

};

var portal=function(x,y){
    this.x=x;
    this.y=y;
    this.width=blockSize;
    this.height=blockSize;
    this.r=0;

    portal.prototype.draw= function() {
     pushMatrix();
     translate(this.x+this.width/2,this.y+this.height/2);
     imageMode(CENTER);
     rotate(this.r);
     image(imgs.portal,0,0);
     this.r+=3;
    popMatrix();

    };
    portal.prototype.check=function(){
        if(checkIn(Player[0].pos.x,Player[0].pos.y,Player[0].width,Player[0].height,this.x,this.y,this.width,this.height)){
        level++;
         drawNewLevel();
        }
    };
    portal.prototype.run=function(){
        this.draw();
        this.check();
    };

};

var drawLevels=function(){
    for(var j=0; j<levels[level].length; j++){
    for(var i=0; i< levels[level][j].length; i++){
         levelH= j*blockSize;
         levelW= i*blockSize;
        switch(levels[level][j][i]){
        //player & portal  {
         case "P":
           Player.push(new player(i*blockSize,j*blockSize));
           spawn.push(new PVector(i*blockSize,j*blockSize));
        break;
        case "@":
            portals.push(new portal(i*blockSize,j*blockSize));
        break;
        case "C":
            checkpoints.push(new checkpoint(i*blockSize,j*blockSize));
        break;
        //}
        //blocks {
          case"B":
            blocks.push(new block(i*blockSize,j*blockSize,"brick"));
        break;
        case"D":
            blocks.push(new block(i*blockSize,j*blockSize,"dirt"));
        break;
        case"G":
            blocks.push(new block(i*blockSize,j*blockSize,"grass"));
        break;
        case"L":
            blocks.push(new block(i*blockSize,j*blockSize,"leaf"));
        break;
        case"T":
            blocks.push(new block(i*blockSize,j*blockSize,"log"));
        break;
        case"R":
            blocks.push(new block(i*blockSize,j*blockSize,"stone"));
        break;
        case"W":
            blocks.push(new block(i*blockSize,j*blockSize,"wood"));
        break;
        //}
        //sprites{
        case"b":
            sprites.push(new sprite(i*blockSize,j*blockSize,"brick"));
        break;
        case"d":
            sprites.push(new sprite(i*blockSize,j*blockSize,"dirt"));
        break;
        case"g":
            sprites.push(new sprite(i*blockSize,j*blockSize,"grass"));
        break;
        case"l":
            sprites.push(new sprite(i*blockSize,j*blockSize,"leaf"));
        break;
        case"t":
            sprites.push(new sprite(i*blockSize,j*blockSize,"log"));
        break;
        case"r":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));
        break;
        case"w":
            sprites.push(new sprite(i*blockSize,j*blockSize,"wood"));
        break;



        case "!":
            turrets.push(new turret(i*blockSize,j*blockSize));
        break;

      /*  case "6":
        lazars.push (new lazar(i*blockSize,j*blockSize, "up"));
        break;
        case ",":
        lazars.push (new lazar(i*blockSize,j*blockSize, "left"));
        break;
        case ".":
        lazars.push (new lazar(i*blockSize,j*blockSize, "right"));
        break;*/
        //}
        //special blocks {
        case "~":
            physblocks.push(new physicblock(i*blockSize,j*blockSize,"water"));
        break;
        case "=":
            physblocks.push(new physicblock(i*blockSize,j*blockSize,"ladder"));
        break;
        case">":
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"speedRight"));
        break;
        case"<":
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"speedLeft"));
        break;
        case"^":
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"speedUp"));
        break;
        case"#":
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"falling"));
        break;
        case"_":
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"jumpthrough"));
        break;
        case"&":
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"moving"));
        break;
        //}


        //}
        // combos {
         case"S":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));

        break;
        case"x":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));
            blockers.push(new blocker(i*blockSize,j*blockSize));
        break;
        case"X":

        break;
        case"3":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"falling"));
        break;
        case"`":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));
            physblocks.push(new physicblock (i*blockSize,j*blockSize,"jumpthrough"));
        break;
         case"2":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));
            portals.push(new portal(i*blockSize,j*blockSize));
        break;
        case"c":
            sprites.push(new sprite(i*blockSize,j*blockSize,"stone"));
            checkpoints.push(new checkpoint(i*blockSize,j*blockSize));
        break;

                //}
        }
    }
    }
};
var drawNewLevel=function(){
     sprites.splice(0,sprites.length);
     blocks.splice(0,blocks.length);
     Player.splice(0,Player.length);
     traps.splice(0,traps.length);
     portals.splice(0,portals.length);
     physblocks.splice(0,physblocks.length);
     enemies.splice(0,enemies.length);
     blockers.splice(0,blockers.length);
     bullets.splice(0,bullets.length);
     turrets.splice(0,turrets.length);
     checkpoints.splice(0,checkpoints.length);
  //   lazars.splice(0,lazars.length);
     drawLevels();
     Player[0].vel.set(0,0);
     Player[0].health=100;
     Player[0].pos.set(spawn[level]);
};
  drawLevels();
var runElements=function(){
    runObj(sprites);
    runObj(physblocks);
    runObj(blocks);
    Player[0].run();
    runObj(checkpoints);
    runObj(portals);
    runObj(traps);
    runSpecial(enemies);
    runSpecial(bullets);
    runObj(turrets);

    if(keys[82]){
        drawNewLevel();
    }
};

draw= function() {
    if(doneLoad===false){
     loadImgs();
    }
    else{
    background(181, 240, 255);
    if(level===2){
    imageMode(CORNER);
    image(imgs.brickback,0,0);
    }
    pushMatrix();
    if(playerCam===true){

    //adjusts TransX and transY {
     transX=-((Player[0].pos.x+(Player[0].width))-width/2);
     transY=-(Player[0].pos.y+Player[0].height/2-height/2);
    //}
    //if TransX and transY are off canvas... {
    if(-transX<=0){
    transX=0;
    }
    if(-transX+width>=levelW+blockSize){
     transX=-levelW+width-blockSize;
    }
    if(-transY<=0){
    transY=0;
    }
    if(-transY+height>=levelH+blockSize){
     transY=-levelH+height-blockSize;
    }
    //}
     translate(transX,transY);
    }
    {
    textFont(createFont("Times"));
    if(level===0){
    fill(43, 43, 43);
    textSize(17);
    text("      Hello and welcome to Jarpletz's Platformer\nEngine! Arrow keys or WASD to move. Please\nnote this is not a full game, but a demonstration\nof my platformer engine, which will be used to\nmake full games in the (not so distant) future!\n\n      For now, tho, try your skill at these two \nshowcase levels I have assembled for you! \n\n--Jarpletz",50,50);
    }
    if(level===1){
    fill(94, 94, 94);
    textSize(17);
    text("Showcase level 1:\n            The Cave", 260,340);
    text("This tree is too tall! Maybe I \n     can get over it from the\n     top of the taller tree...",580,316);
    }
    if(level===2){
     textSize(21);
     fill(245, 245, 245);
     text("Showcase level 2: The Factory", 100,170);
    }
    if(level===3){
    textSize(21);
    fill(50);
    text("      You have reached the end of the \nShowcase levels! If you want to make\nyour own platformer using my engine, \nplease contact me in the T&T. Here is \nall the items I used--thanks for playing!", 50,200);
    }
    }//text
    runElements();
    popMatrix();
    }
};


keyPressed = function(){
   keys[keyCode] = true;
   if(keyCode===10){
    Program.restart();
   }
};
keyReleased = function(){
   keys[keyCode] = false;
};

void setup()
{
  size(400,400);
}