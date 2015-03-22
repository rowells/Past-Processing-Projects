/*
Assignment Name: Final Project
Author(s):
Emma Mossinger, Steve Rowell, Steven Van Buskirk, Ronny Hafeza
File Description: This file is the main program the creates a falling balls game
Resources Used: processing website , 
Additional Notes: 
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim music;
AudioPlayer song;


Button helpButton;
Button quitButton;
Button retryButton;
Button counterButton;
Button highScoreButton;
Button modeOneButton;
Button modeTwoButton;
Button modeThreeButton;
Button mainMenuButton;

Words intro;
Words help;
Words quit;
Words retry;
Words counter;
Words hS;
Words modeOne;
Words modeTwo;
Words modeThree;
Words mainMenu;

int highScore;
int highScore2;
int highScore3;
int timeWait = 0;
int i = 0;
int count = 0;
int count2 = 0;
int count3 = 0;

int previousState;
ArrayList myBalls;

int timeAdjuster=1;
int ballSizeAdjuster=1;

int modeState = 0;
Man man;

//boolean gameStart=false;

PImage fallingBallsImage;

void setup() 
{
  music = new Minim(this);
  song = music.loadFile("SpanishFlea.mp3");
  song.play();

  loadState("highScore.txt");
  loadState2("highScore2.txt");
  loadState3("highScore3.txt");

  size(1200, 650);
  fallingBallsImage = loadImage("fallingBalls.jpg");
  myBalls = new ArrayList();

  man=new Man();
  background(0, 100, 0);

  intro = new Words(width/2, height/12, 50, color(0, 150, 200), "Falling Balls");
  
  helpButton = new Button(width/2, 375, 125, 50);
  help = new Words(width/2, 385, 30, color(200, 200, 0), "Help");
  modeOneButton = new Button(350, 475, 125, 50);
  modeOne = new Words(350, 485, 30, color(200, 200, 0), "Mode 1");
  modeTwoButton = new Button(width/2, 475, 125, 50);
  modeTwo = new Words(width/2, 485, 30, color(200, 200, 0), "Mode 2");
  modeThreeButton = new Button(850, 475, 125, 50);
  modeThree = new Words(850, 485, 30, color(200, 200, 0), "Mode 3");
  quitButton = new Button(width/2, 575, 125, 50);
  quit = new Words(width/2, 585, 30, color(200, 200, 0), "Quit");

  counter = new Words(400, 70, 30, color(10, 190, 70), "Score: ");
  hS = new Words(800, 70, 30, color(10, 190, 70), "High Score: ");

  mainMenuButton = new Button(400, 485, 175, 50);
  mainMenu = new Words(400, 495, 30, color(200, 200, 0), "Main Menu");
  retryButton = new Button(750, 485, 175, 50);
  retry = new Words(750, 495, 30, color(200, 200, 0), "Retry?");
}

void draw() 
{
  textAlign(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);

  if (modeState == 0)
  {
    intro.display();
    image(fallingBallsImage, width/2, height/2.5);
    helpButton.display();
    help.display();
    modeOneButton.display();
    modeOne.display();
    modeTwoButton.display();
    modeTwo.display();
    modeThreeButton.display();
    modeThree.display();
    quitButton.display();
    quit.display();
  }
  if (modeState == 1)
  {
    background(0, 100, 0);
    fill(255);
    rect(width/2, height/2, 900, 650);
    rect(width/2, height*33/34, 900, 50);
    fill(0, 0, 0);
    text("Try not to die!", 600, 200, 250, 250);
    man.display(); 

    if (timeWait == 0)
    {
      timeWait = int(random(30+timeAdjuster, 150+timeAdjuster));
      myBalls.add(new Balls(150, 0, 2, int(random(50+ballSizeAdjuster, 150+ballSizeAdjuster))));
    }
    for (int i = myBalls.size()-1; i >= 0; i--) 
    {
      Balls ball = (Balls) myBalls.get(i);
      ball.display();
      ball.ballMoveX();
      ball.ballMoveY();

      if (ball.isBallHitMan(man.getX(), man.getY()))
      {
        
        if (count > highScore)
        {
         highScore=count;
        }
        man.setManState(false);
        man.moveLeft=false;
        man.moveRight=false;
        modeState=4;
        previousState=1;
        count=0;
    
      }


      if (ball.getX() >= 950 && ball.flag == false)
      {
        count = count + 1;
        ball.flag = true;
        //println(count);
      }
      if ( ball.getX() >= width + 100)
      {
        myBalls.remove(i);
      }
    }
    timeWait = timeWait-1;
    
    counter.setText("Score: " + count);
    counter.display();

    saveState("highScore.txt");
    println("got here");
    hS.setText("High Score: " + highScore);
    hS.display();
  }
  if (modeState == 2)
  {
    background(0, 100, 0);
    fill(255);
    rect(width/2, height/2, 900, 650);
    rect(width/2, height*33/34, 900, 50);
    fill(0, 0, 0);
    text("Try not to die!", 600, 200, 250, 250);
    man.display(); 

    if (timeWait == 0)
    {
      timeWait = int(random(30+timeAdjuster, 150+timeAdjuster));
      myBalls.add(new Balls(150, 0, 2, int(random(50+ballSizeAdjuster, 150+ballSizeAdjuster))));
    }
    for (int i = myBalls.size()-1; i >= 0; i--) 
    {
      Balls ball = (Balls) myBalls.get(i);
      ball.display();
      ball.ballMoveX();
      ball.ballMoveY();

      if (ball.isBallHitMan(man.getX(), man.getY()))
      {
        if (count2 > highScore2)
        {
           highScore2=count2;
        }
        
        man.setManState(false);
        modeState=4;
        count2=0;
        previousState=2;
        man.moveLeft=false;
        man.moveRight=false;
        
      }

      if (ball.getX() >= 950 && ball.flag == false)
      {
        count2 = count2 + 1;
        ball.flag = true;
      }
      if ( ball.getX() >= width + 100 || (ball.isOver()&&mousePressed))
      {
        myBalls.remove(i);
        count2++;
      }
    }
    timeWait = timeWait-1;

    counter.setText( "Score: " + count2 );
    counter.display();

    saveState2("highScore2.txt");
    hS.setText("High Score: " + highScore2);
    hS.display();
  }
  if (modeState == 3)
  {
    background(0, 100, 0);
    fill(255);
    rect(width/2, height/2, 900, 650);
    rect(width/2, height*33/34, 900, 50);
    fill(0, 0, 0);
    text("Try not to die!", 600, 200, 250, 250);
    man.display(); 

    if (timeWait == 0)
    {
      timeWait = int(random(30+timeAdjuster, 150+timeAdjuster));
      myBalls.add(new Balls(150, 0, 2, int(random(50+ballSizeAdjuster, 150+ballSizeAdjuster))));
    }
    for (int i = myBalls.size()-1; i >= 0; i--) 
    {
      Balls ball = (Balls) myBalls.get(i);
      ball.display();
      ball.ballMoveX();
      ball.ballMoveY();

      if (ball.isBallHitMan(man.getX(), man.getY()))
      {
       if (count3 > highScore3)
      {
         highScore3=count3;
      }
        man.setManState(false);
        modeState=4;
        count3=0;
        previousState=3;
        man.moveLeft=false;
       man.moveRight=false;
        
      }

      if (ball.getX() >= 950 && ball.flag == false)
      {

        count3 = count3 + 1;
        ball.flag = true;
        //println(count);
      }
      if ( ball.getX() >= width + 100 || (ball.isOver()&&mousePressed) )
      {
        myBalls.remove(i);
        count3++;
      }
    }
    timeWait = timeWait-1;

    counter.setText( "Score: " + count3 );
    counter.display();
    
    
      

    saveState3("highScore3.txt");
    hS.setText("High Score: " + highScore3);
    hS.display();
  }
  if (modeState == 4)
  {
    background(0, 100, 0);
    fill(255);
    rect(width/2, height/2, 900, 650);
    rect(width/2, height*33/34, 900, 50);
    fill(0, 0, 0);
    man.display(); 

    if (timeWait == 0)
    {
      timeWait = int(random(30+timeAdjuster, 150+timeAdjuster));
      myBalls.add(new Balls(150, 0, 2, int(random(50+ballSizeAdjuster, 150+ballSizeAdjuster))));
    }
    for (int i = myBalls.size()-1; i >= 0; i--) 
    {
      Balls ball = (Balls) myBalls.get(i);
      ball.display();
      ball.ballMoveX();
      ball.ballMoveY();


      if (ball.getX() >= 950 && ball.flag == false)
      {
        ball.flag = true;
        //println(count);
      }
      if ( ball.getX() >= width + 100 || (ball.isOver()&&mousePressed))
      {
        myBalls.remove(i);
      }
      mainMenuButton.display();
      mainMenu.display();
      retryButton.display();
      retry.display();
    }

    rectMode(CENTER);
    fill(255, 0, 0, 150);
    rect(600, 325, 1200, 650);
    fill(0, 0, 0);
    textSize(225);
    text("YOU DIED.", 600, 325);
    

    timeWait = timeWait-1;

    counter.display();
    hS.display();
  }
  if (modeState == 5)
  {
    
    background(0, 100, 0);
    fill(255);
    rect(width/2, height/2, 900, 650);
    //rect(width/2, height*33/34, 900, 50);
    fill(0, 0, 0);
    textSize(13);
    textAlign(CORNER);
    text("Instructions", 180,50);
    text("-------------------------------------------------------------------",180, 60);
    text("In all modes, each time a ball leaves the screen, a point is scored.", 180,75);
    text("In all modes, if a ball lands on the stick figure man, he dies.", 180,95);
    text("Mode 1 : Move to avoid the falling balls.", 180, 135);
    text("Mode 2 : Click the balls to make them disappear and to score a point. You can not move.", 180, 155);
    text("Mode 3 : Click the balls to make them disappear, while moving to avoid the falling balls, to score a point.", 180, 175);
    text("Commands:", 180, 215);
    text("Press H to save the game and return to the home screen", 180, 235);
    text("Press Q to quit without saving", 180, 255);
    text("Press D to decrease the size of the balls", 180, 275);
    text("Press F to increase the size of the balls", 180, 295);
    text("Press O to decrease the frequency of balls", 180, 315);
    text("Press P to increase the frequency of balls", 180, 335);
    text("Press the left and right arrow keys to move", 180, 355);
    
    mainMenuButton.display();
    mainMenu.display();
    
  }
}

void saveState(String fileName)
{
  PrintWriter out;
  out = createWriter(fileName);
  if (count > highScore)
  {
    out.print(count);
  }
  else
  {
    out.print(highScore);
  }
  out.flush();
  out.close();
}

void loadState(String fileName)
{
  String [] data = loadStrings (fileName);
  highScore = int(data[0]);
}
void saveState2(String fileName)
{
  PrintWriter out;
  out = createWriter(fileName);
  if (count2 > highScore2)
  {
    out.print(count2);
  }
  else
  {
    out.print(highScore2);
  }
  out.flush();
  out.close();
}

void loadState2(String fileName)
{
  String [] data = loadStrings(fileName); 
  highScore2 = int(data[0]);
}

void saveState3(String fileName)
{
  PrintWriter out;
  out = createWriter(fileName);
  if (count3 > highScore3)
  {
    out.print(count3);
  }
  else
  {
    out.print(highScore3);
  }
  out.flush();
  out.close();
}

void loadState3(String fileName)
{
  String [] data = loadStrings(fileName);
  highScore3 = int(data[0]);
}
void mousePressed()
{
  if (modeOneButton.isOver() && modeState==0)
  {
    modeState = 1;
  }
  if (modeTwoButton.isOver() && modeState==0)
  {
    modeState = 2;
  }
  if (modeThreeButton.isOver() && modeState==0)
  {
    modeState = 3;
  }
  if (helpButton.isOver() && modeState == 0)
  {
    modeState=5;
  }
  if (quitButton.isOver() && modeState == 0)
  {
    exit();
  }
  
  if (mainMenuButton.isOver() && (modeState == 4|modeState==5))
  {
    count=0;
    man.setManState(true);
    background(0, 100, 0);
    modeState = 0;
    for (int j = myBalls.size()-1; j >= 0; j--) 
    {
       myBalls.remove(j);
    }
    man.setX(width/2);
    man.setY(height-(man.getManHeight()+30));
  }
  if (retryButton.isOver() && modeState == 4)
  {
    modeState=previousState;
    man.setManState(true);
    count=0;
    for (int j = myBalls.size()-1; j >= 0; j--) 
    {
          myBalls.remove(j);
    }
    man.setX(width/2);
    man.setY(height-(man.getManHeight()+30));
  }
}
void keyPressed()
{
  if (modeState == 1 || modeState == 3)
  {
    if (keyCode==RIGHT)
    {
      man.moveRight=true;
    }
    if (keyCode==LEFT)
    {
      man.moveLeft=true;
    }
  }
  if(key=='O'|key=='o')
  {
    if(timeAdjuster<1000)
    {
      timeAdjuster++;
      println(timeAdjuster);
    }
  }
  if(key=='P'|key=='p')
  {
    if(timeAdjuster>-29)
    {
      timeAdjuster--;
      println(timeAdjuster);
    }
  }
  if(key=='D'|key=='d')
  {
    if(ballSizeAdjuster>-49)
    {
      ballSizeAdjuster--;
      println(ballSizeAdjuster);
    }
  }
  if(key=='F'|key=='f')
  {
    if(ballSizeAdjuster<1000)
    {
      ballSizeAdjuster++;
      println(ballSizeAdjuster);
    }
  }
  if(key=='h'|key=='H')
  {
    if(modeState==1)
    {
      if (count > highScore)
        {
           highScore=count;
        }
      saveState("highScore.txt");
      count=0;
    }
    else if(modeState==2)
    {
     if (count2 > highScore2)
        {
           highScore2=count2;
        }
      saveState2("highScore2.txt");
      count2=0;
    }
    else if(modeState==3)
    {
      if (count3 > highScore3)
        {
           highScore3=count3;
        }
      saveState3("highScore3.txt");
      count3=0;
    }
    modeState=0;  
    
    man.setManState(true);
    background(0, 100, 0);
    modeState = 0;
    for (int j = myBalls.size()-1; j >= 0; j--) 
    {
       myBalls.remove(j);
    }
    man.setX(width/2);
    man.setY(height-(man.getManHeight()+30));
  }
  if(key=='q'|key=='Q')
  {
    exit();
  }
  
  
}

void keyReleased()
{
  if (modeState == 1 || modeState == 3)
  {
    if (keyCode==RIGHT)
    {
      man.moveRight=false;
      man.moveLeft=false;
    }
    if (keyCode==LEFT)
    {
      man.moveLeft=false;
      man.moveRight=false;
    }
  }
}

