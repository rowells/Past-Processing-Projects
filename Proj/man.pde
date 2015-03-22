boolean living;



class Man
{
  int manX;
  int manY;

  int manHeight;
  int manWidth;
  
  int manStrokeWeight;
  color manStroke;
  color manFill;

  int manMoveSpeed;

  int manLag;
  
  boolean alive;

  boolean moveRight;
  boolean moveLeft;

  boolean oscillator;

  int oscillationLag=15;
  int oscillationLagTracker=oscillationLag;
  
  PImage deadMan;
  
  PImage manStill;
  
  PImage manRight1;
  PImage manRight2;
  
  PImage manLeft1;
  PImage manLeft2;
  

  Man()
  {
    manHeight=40;
    manWidth=40;
    
    manX=width/2;
    manY=height-(manHeight+30);

    manStrokeWeight=1;
    manStroke=color(0, 0, 0, 0);
    manFill=color(255, 255, 255, 0);

    manMoveSpeed=15;
    manLag=0;
    
    alive = true;

    oscillator=true;

    moveRight=false;
    moveLeft=false;

    oscillationLag=5;
    oscillationLagTracker=oscillationLag;
    
    deadMan = loadImage("dead.png");
    
    manStill=loadImage("man_still.jpg");
    
    manRight1=loadImage("man_right1.jpg");
    manRight2=loadImage("man_right2.jpg");
    
    manLeft1=loadImage("man_left1.jpg");
    manLeft2=loadImage("man_left2.jpg");
    
    
  }
  Man(int mX, int mY, int mH, int mSW, color s, int mvS, int lg)
  {
    manX=mX;
    manY=mY;
    manHeight=mH;
    manStrokeWeight=mSW;
    manStroke=s;

    manMoveSpeed=mvS;
    manLag=lg;
  }
  void setX(int mX)
  {
    manX=mX;
  }
  void setY(int mY)
  {
    manY=mY;
  }
  void setManHeight(int mH)
  {
    manHeight=mH;
  }
  void setManStrokeWeight(int mSW)
  {
    manStrokeWeight=mSW;
  }
  void setManStroke(color s)
  {
    manStroke=s;
  }
  void setMoveSpeed(int mvS)
  {
    manMoveSpeed=mvS;
  }
  void setManLag(int lg)
  {
    manLag=lg;
  }
  void setManState(boolean state)
  {
    alive = state;
  }
  int getX()
  {
    return manX;
  }
  int getY()
  {
    return manY;
  }
  int getManHeight()
  {
    return manHeight;
  }
  int getManStrokeWeight()
  {
    return manStrokeWeight;
  }
  color getManStroke()
  {
    return manStroke;
  }
  int getMoveSpeed()
  {
    return manMoveSpeed;
  }
  int getManLag()
  {
    return manLag;
  }
  boolean getManState()
  {
    return alive;
  }
  void moveRight()
  {
    if (manX<1000)
    {
      manX=manX+manMoveSpeed;
    }
  }
  void moveLeft()
  {
    if (manX>250)
    {
      manX=manX-manMoveSpeed;
    }
  }
  void display()
  {
    fill(manFill);
    stroke(manStroke);
    strokeWeight(manStrokeWeight);
    


    float oscillationMovement=3;

    if (!alive)
    {
      image(deadMan, manX, manY);
    }

    if (!moveRight && !moveLeft && alive)
    {
      oscillationLagTracker--;
      if (oscillator)
      {
    
        image(manStill,manX,manY);

        if (oscillationLagTracker==0)
        {
          oscillator=!oscillator;
          oscillationLagTracker=oscillationLag;
          
        }


      }
      else
      {
        image(manStill,manX,manY+oscillationMovement);
        if (oscillationLagTracker<0)
        {
          
          oscillator=!oscillator;
          oscillationLagTracker=oscillationLag;
        }
      }
    }
    else if (moveRight && alive)
    {
      moveRight();
      oscillationLagTracker--;
      if (!oscillator)
      {

        image(manRight1,manX,manY);
        
        if (oscillationLagTracker<0)
        {
          oscillator=!oscillator;
          oscillationLagTracker=oscillationLag;
        }
        
      }
      else
      {
        image(manRight2,manX,manY);
        
        if (oscillationLagTracker<0)
        {
          oscillator=!oscillator;
          oscillationLagTracker=oscillationLag;
        }
        
      }
    }
    else if (moveLeft && alive)
    {
       moveLeft();
      oscillationLagTracker--;
      if (!oscillator)
      {
        
        image(manLeft1,manX,manY);

        if (oscillationLagTracker<0)
        {
          oscillator=!oscillator;
          oscillationLagTracker=oscillationLag;
        }
        
      }
      else
      {
         image(manLeft2,manX,manY);

        if (oscillationLagTracker<0)
        {
          oscillator=!oscillator;
          oscillationLagTracker=oscillationLag;
        }
        
      }
    }
    //moveLeft=false;
    //moveRight=false;
  }
}

