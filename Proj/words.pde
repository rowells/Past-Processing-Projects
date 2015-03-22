class Words
{
  float xPos;
  float yPos;
  float wordSize;
  color wordColor;
  String wordText;
  
  Words(float xposW, float  yposW, float wordS, color wordC, String enterWords)
  {
    xPos=xposW;
    yPos=yposW;
    wordSize=wordS;
    wordColor=wordC;
    wordText=enterWords;
  }
  void display()
  {
    textAlign(CENTER);
    fill(wordColor);
    textSize(wordSize);
    text (wordText, xPos, yPos);
  }
  void setText(String wText)
  {
    wordText=wText;
  }
}

