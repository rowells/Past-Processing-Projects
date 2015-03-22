class Balls 
{
  float xposBalls;
  float yposBalls;
  float ballSpeed;
  float ballSize;
  float randomSpeedX;
  float time;
  float accel=0.75;
  int count = 0;
  boolean flag;

  Balls(float xpos, float ypos, float speed, float size2)
  {
    xposBalls = xpos;
    yposBalls = ypos;
    ballSpeed = speed;
    ballSize = size2;
    randomSpeedX = int(random(50, 200));
    time=0;
    flag = false;
  }

  void ballMoveX()
  {
    xposBalls = xposBalls + ballSpeed*(randomSpeedX)*(0.01);
  }
  void ballMoveY()
  {
    yposBalls = yposBalls + accel*time;
    if ((yposBalls + (ballSize/2)) > height*33/34)
    {
      time=-35;
    }
  }
  boolean isOver()
  {
    float distance=sqrt(sq(mouseX-xposBalls)+sq(mouseY-yposBalls));
    if (distance<(ballSize/2))
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void display()
  {
    fill(255);
    strokeWeight(3);
    ellipse(xposBalls, yposBalls, ballSize, ballSize);
    time++;
  }
  float getX()
  {
    return xposBalls;
  }
  
  boolean isBallHitMan(int manX, int manY)
  {
    float distance = sqrt(sq(manX-xposBalls)+sq(manY-yposBalls));
    
    if (distance < (ballSize/2) + 15)
    {
      return true;
    }
    return false;
  }
}

