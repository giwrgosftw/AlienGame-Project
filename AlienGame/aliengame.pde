//P
PImage startscreen;

//float ellipse data
float ellipse_x=random(400);
float ellipse_y=27;

//float triangle data
float triangle_x1=180;
float triangle_y1=395;
float triangle_x2=220;
float triangle_y2=395;
float triangle_x3=200;
float triangle_y3=360;

//float ellipse bullet data
float bullet_x=200;
float bullet_y=352;

//float boolean
boolean flag;

//float score
int stage;
int score=0;
int bestscore=0;
int level=1;

//music
import ddf.minim.*;

AudioPlayer win,lazer,startSong,mainSong,gameOver;
Minim minim;


//setup
void setup(){
  stage=1;
  size(400,400);
  textAlign(CENTER);
  startscreen= loadImage ("start.jpg");
  startscreen.resize(400,400);
  image(startscreen, 0, 0);
  
  
  //Songs
  minim = new Minim(this);
  win = minim.loadFile("Win - Sound (mp3cut.net).mp3");
  lazer = minim.loadFile("Laser - Sound (mp3cut.net).mp3");
  startSong = minim.loadFile("John Williams - Star Wars Main Theme (Cut).mp3");
  mainSong = minim.loadFile("Star Wars - The Imperial March (Darth Vaders Theme).mp3");
  gameOver=minim.loadFile("Game Over (mp3cut.net).mp3");
}


void draw(){
  
 if(stage==1){
   startSong.play();
    if(keyPressed==true){
      stage=2;
    }
  }
 else if(stage==2){
   startSong.pause();
   mainSong.play();
   
   
  //triagnle
  background(0);
  noStroke();
  fill(#CECECE);
  triangle(triangle_x1,triangle_y1, triangle_x2,triangle_y2, triangle_x3,triangle_y3);
  
  //ellipse
  stroke(#007437);
  fill(0,255,0);
  ellipse(ellipse_x,ellipse_y,30,30);
  
  //bullet
  stroke(#CECECE);
  fill(255,0,0);
  ellipse(bullet_x,bullet_y,10,10);
  
  //stars
  strokeWeight(3);
  stroke(255,255,255);
  fill(255,255,255);
  point(random(400),random(400));
  
  
  //when the ball pass the windows-starts again
  if(ellipse_y>height){
    ellipse_y=-30;
    ellipse_x=random(400);
  }

  
 //movement of triagnle and bullet based on score
  if(score<10){
    ellipse_y=ellipse_y+1.5;
    
    if(keyCode == LEFT){
    triangle_x1=triangle_x1-2;
    triangle_x2=triangle_x2-2;
    triangle_x3=triangle_x3-2;
  
    bullet_x=bullet_x-2;
    }
    
    else if(keyCode== RIGHT){
    triangle_x1=triangle_x1+2;
    triangle_x2=triangle_x2+2;
    triangle_x3=triangle_x3+2;
  
    bullet_x=bullet_x+2;
    }
  } 
    
  else if(score<20){
    ellipse_y=ellipse_y+2;
    
    if(keyCode == LEFT){
    triangle_x1=triangle_x1-2.5;
    triangle_x2=triangle_x2-2.5;
    triangle_x3=triangle_x3-2.5;
  
    bullet_x=bullet_x-2.5;
    }
    
    else if(keyCode== RIGHT){
    triangle_x1=triangle_x1+2.5;
    triangle_x2=triangle_x2+2.5;
    triangle_x3=triangle_x3+2.5;
  
    bullet_x=bullet_x+2.5;
    }
  }
  else if(score<30){
    ellipse_y=ellipse_y+3;
    
    if(keyCode == LEFT){
    triangle_x1=triangle_x1-2.5;
    triangle_x2=triangle_x2-2.5;
    triangle_x3=triangle_x3-2.5;
  
    bullet_x=bullet_x-2.5;
    }
    
    else if(keyCode== RIGHT){
    triangle_x1=triangle_x1+2.5;
    triangle_x2=triangle_x2+2.5;
    triangle_x3=triangle_x3+2.5;
  
    bullet_x=bullet_x+2.5;
    }
  }
  else{
    ellipse_y=ellipse_y+4;
    
    if(keyCode == LEFT){
    triangle_x1=triangle_x1-3.5;
    triangle_x2=triangle_x2-3.5;
    triangle_x3=triangle_x3-3.5;
  
    bullet_x=bullet_x-3.5;
    }
    
    else if(keyCode== RIGHT){
    triangle_x1=triangle_x1+3.5;
    triangle_x2=triangle_x2+3.5;
    triangle_x3=triangle_x3+3.5;
  
    bullet_x=bullet_x+3.5;
    }
   }
 

 //triangle doesn't get out of the screen
 if((triangle_x1>width-40) || (triangle_x2>width-2) || (triangle_x3>width-20)){
     triangle_x1=width-40;
     triangle_x2=width-2;
     triangle_x3=width-20;
     
     bullet_x=width-20;
     //for right side
  }
   if((triangle_x1<2) || (triangle_x2<40) || (triangle_x3<20)){
     triangle_x1=2;
     triangle_x2=40;
     triangle_x3=20;
     
     bullet_x=20;
     //for right side
  }


  // shoot if press space
  if(key == ' '){
    lazer.play();
    if(bullet_y==352){
    lazer.rewind();
    }
    flag=true;
  }
  
  
  //move bullets
   if(flag==true){
   bullet_y=bullet_y-10;
   }

   
  //reset bullets
  if(bullet_y<0){
   bullet_y=352;
   flag=false;
     }
 
 
 //ball doesnt get out of the window  
  if(ellipse_x>width-20){
     ellipse_x=width-20;
     //for right side
  }
  if(ellipse_x<20){
     ellipse_x=20;
     //for left side
  }


 //destroy alien
 if(bullet_y<ellipse_y+14 && bullet_y>ellipse_y-14 && bullet_x<ellipse_x+14 && bullet_x>ellipse_x-14){
  ellipse_y=-30;
  ellipse_x=random(400);
  score=score+1;
  
  if(bestscore<score){
    bestscore=score;
   }
  
  if(score==10){
    level=2;
  }
  else if(score==20){
    level=3;
  }
  else if(score==40){
    level=4;
  }
 }
  
  
  //Texts
  textSize(20);
  text("Score ",187,190);
  text(score,230,190);
  
  textSize(20);
  text("Level ",187,215);
  text(level,230,215);
  
  textSize(12);
  text("4 LEVELS",373,45);
  text("'SPACE' -> HIT",356,30);
  text("'← →' -> MOVEMENT",337,15);
  
  //text-sound if you win
  if(score==40){
  mainSong.pause();
  lazer.pause();
  win.play();
    
  textSize(30); 
  text("Congratulations!",200,100);
  
  textSize(21.5); 
  text("You saved the galaxy from the aliens!!",200,146);
  
  textSize(20); 
  text("Press 'ENTER' TO PLAY AGAIN",200,250);
  }
  
  //text-sound if game is over     
  if(ellipse_y+14>=400){
  mainSong.pause();
  lazer.pause();
  win.pause();
  gameOver.play();
    
  textSize(60); 
  text("GAME OVER!",200,100);
  
  textSize(30);
  text("BEST SCORE",180,150);
  text(bestscore,295,150);
  
  textSize(20);
  text("PRESS 'ENTER' TO START AGAIN",203,250);
  }
  
  
  //when stop the game or restart
  if(ellipse_y+14>=400 || score==40){
    noLoop();
    keyPressed();
  }
  
  
  //Sound when the game stop or restart
  if(score==40){
    gameOver.pause();
    mainSong.pause();
    lazer.pause();
    win.rewind();
  }
  if(ellipse_y+14>=400){
   mainSong.pause();
   lazer.pause();
   win.pause();
   gameOver.rewind();
  }
  
 }
}


void keyPressed() {
    if (key == ENTER){
    loop(); 
    score=0;
    level=1;
    mainSong.rewind();
    win.pause();
    gameOver.pause();
    }
}