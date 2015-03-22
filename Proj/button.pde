class Button
{

  float xPos;
  float yPos;
  float buttonWidth;
  float buttonHeight;

  Button(float xpos, float ypos, float buttonW, float buttonH)
  {
    xPos=xpos;
    yPos=ypos;
    buttonWidth=buttonW;
    buttonHeight=buttonH;
  }
  void display()
  {
    rectMode(CENTER);
    fill(0, 50, 200);
    rect(xPos, yPos, buttonWidth, buttonHeight);
  }
  boolean isOver()
  {
    if ((mouseX > (xPos-(buttonWidth/2)) && mouseX < xPos+(buttonWidth/2)) && ((mouseY >(yPos-(buttonHeight/2))) && (mouseY < (yPos+(buttonHeight/2)))))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
} 

