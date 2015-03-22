/*
Assignment: Assignment 4
 
 Author: Steve Rowell
 
 Description: This program, when run, will display three dice. Clicking the "roll dice" button will randomize the faces of the die such that it will display dots(counting from 1 - 6). 
 It is possible to 'hold' each dice by clicking on it so its value is the same. The value of the three die are totaled and displayed in the second box.
 
 Resources used: Worked together with Emma Mossinger and Ronny Hafeza, porcessing.org
 
 Additional Notes: Click the 'roll' button to roll. Click a dice to hold its value.
 
 */

// variables for the roll button
int rollButtonX = 140;                  // the button top left corner X value
int rollButtonY = 190;                  // the button top left corner Y value
int rollButtonWidth = 110;              // the button width
int rollButtonHeight =55;             // the button height
int rollButtonStrokeWidth = 2;   // the stroke width for the button

color rollButtonFill = color (255);             // the button fill color
color rollButtonOutline = color (0);          // the button outline color (stroke color)
color rollButtonClickedFill = color(0, 255, 0);      // the button color when the button is clicked
color rollButtonClickedOutline = color(255, 255, 0);   // the button outline color when button is clicked
color rollButtonTextColor = color(0);                  // the color of the text for the button
String rollButtonText = "Dice Roll";            // text to display inside of the button

// First Dice
int dice1X = 80;                  // the button top left corner X value
int dice1Y = 80;                  // the button top left corner Y value
int dice1Value;              // the value of the dice, which is equal to the # of dots displayed
boolean dice1Hold = false;           // whether to keep the value of die one and not allow re-rolling

//Second Dice
int dice2X = dice1X+150;                  // the button top left corner X value
int dice2Y = 80;                  // the button top left corner Y value
int dice2Value;              // the value of the dice, which is equal to the # of dots displayed
boolean dice2Hold = false;           // whether to keep the value of die two and not allow re-rolling

// Third Dice
int dice3X = dice2X+150;                  // the button top left corner X value
int dice3Y = 80;                  // the button top left corner Y value
int dice3Value;              // the value of the dice, which is equal to the # of dots displayed
boolean dice3Hold = false;           // whether to keep the value of die three and not allow re-rolling

// Universal dice values
int diceSize  = 90;               // the button width and height
int diceStrokeWidth = 2;        // the stroke width for the button
color diceFill = color(255);             // the button fill color
color diceOutline = color(0);          // the button outline color (stroke color)
color diceClickedFill = color (0, 131, 255);      // the button color when the button is clicked
color diceClickedOutline = color (0, 0, 255);   // the button outline color when button is clicked
color diceDotFill = color(0, 0, 0);          // color of the fill of the dice dots
color diceDotOutline = color(0, 0, 0);       // color the stroke of the dice dots
color diceEmptyFill = color(200, 200, 200);        // the color of the dice before being rolled

int diceTotal;              // the total of all three dice

// variables for total lab box
final String totalText = "Total = ";
int totalX = 300;
int totalY = 190;
color totalBoxOutline= color(0);
color totalBoxFill = color(255);
color totalTextColor = color(0);
int totalBoxWidth = 110;
int totalBoxHeight = 55;


//General Parameters
void setup()
{
  size(450, 270);
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  diceTotal = 0;

  stroke(rollButtonOutline);
  fill(rollButtonFill);
  rect(rollButtonX, rollButtonY, rollButtonWidth, rollButtonHeight);
  textAlign(CENTER, CENTER);
  fill(rollButtonTextColor);
  text(rollButtonText, rollButtonX, rollButtonY);
}

void draw()
{
  //total value command
  diceTotal=dice1Value+dice2Value+dice3Value;
  stroke(totalBoxOutline);
  fill(totalBoxFill);
  rect(totalX, totalY, totalBoxWidth, totalBoxHeight);
  textAlign(CENTER, CENTER);
  fill(totalTextColor);
  text(totalText + diceTotal, totalX, totalY);

  //"Dice Roll" button values when pressed
  if ((mouseX > 80 && mouseX < 200 && mouseY > 160 && mouseY < 220) && mousePressed)
  {
    stroke(rollButtonClickedOutline);
    fill(rollButtonClickedFill);
    rect(rollButtonX, rollButtonY, rollButtonWidth, rollButtonHeight);
    textAlign(CENTER, CENTER);
    fill(rollButtonTextColor);
    text(rollButtonText, rollButtonX, rollButtonY);
  }
  else
  {
    stroke(rollButtonOutline);
    fill(rollButtonFill);
    rect(rollButtonX, rollButtonY, rollButtonWidth, rollButtonHeight);
    textAlign(CENTER, CENTER);
    fill(rollButtonTextColor);
    text(rollButtonText, rollButtonX, rollButtonY);
  }

  //position and fill of third dice
  if (dice1Hold == false)
  {
    strokeWeight(diceStrokeWidth);
    smooth();
    stroke(diceOutline);
    fill(diceFill);
    rect(dice1X, dice1Y, diceSize, diceSize);
  }
  else
  {
    strokeWeight(diceStrokeWidth);
    smooth();
    stroke(diceClickedOutline);
    fill(diceClickedFill);
    rect(dice1X, dice1Y, diceSize, diceSize);
  }

  //position and fill of third dice
  if (dice2Hold == false)
  {
    strokeWeight(diceStrokeWidth);
    smooth();
    stroke(diceOutline);
    fill(diceFill);
    rect(dice2X, dice2Y, diceSize, diceSize);
  }
  else
  {
    strokeWeight(diceStrokeWidth);
    smooth();
    stroke(diceClickedOutline);
    fill(diceClickedFill);
    rect(dice2X, dice2Y, diceSize, diceSize);
  }

  //position and fill of third dice
  if (dice3Hold == false)
  {
    strokeWeight(diceStrokeWidth);
    smooth();
    stroke(diceOutline);
    fill(diceFill);
    rect(dice3X, dice3Y, diceSize, diceSize);
  }
  else
  {
    strokeWeight(diceStrokeWidth);
    smooth();
    stroke(diceClickedOutline);
    fill(diceClickedFill);
    rect(dice3X, dice3Y, diceSize, diceSize);
  }

  //Displays the side the first dice landed on
  if (dice1Value == 1)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice1X, dice1Y, 15, 15);
  }
  else if (dice1Value == 2)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice1X-diceSize/4, dice1Y-diceSize/4, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y+diceSize/4, 15, 15);
  }
  else if (dice1Value == 3)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice1X, dice1Y, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y-diceSize/4, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y+diceSize/4, 15, 15);
  }
  else if (dice1Value == 4)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice1X+diceSize/4, dice1Y+diceSize/4, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y+diceSize/4, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y-diceSize/4, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y-diceSize/4, 15, 15);
  }
  else if (dice1Value == 5)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice1X, dice1Y, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y+diceSize/4, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y+diceSize/4, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y-diceSize/4, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y-diceSize/4, 15, 15);
  }
  else if (dice1Value == 6)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice1X+diceSize/4, dice1Y, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y+diceSize/4, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y-diceSize/4, 15, 15);
    ellipse(dice1X-diceSize/4, dice1Y+diceSize/4, 15, 15);
    ellipse(dice1X+diceSize/4, dice1Y-diceSize/4, 15, 15);
  }
  else
  {
    stroke(diceStrokeWidth);
    fill(diceEmptyFill);
    rect(dice1X, dice1Y, diceSize, diceSize);
  }

  //Displays the side the second dice landed on

  if (dice2Value == 1)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice2X, dice2Y, 15, 15);
  }
  else if (dice2Value == 2)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice2X-diceSize/4, dice2Y-diceSize/4, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y+diceSize/4, 15, 15);
  }
  else if (dice2Value == 3)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice2X, dice2Y, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y-diceSize/4, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y+diceSize/4, 15, 15);
  }
  else if (dice2Value == 4)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice2X+diceSize/4, dice2Y+diceSize/4, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y+diceSize/4, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y-diceSize/4, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y-diceSize/4, 15, 15);
  }
  else if (dice2Value == 5)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice2X, dice2Y, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y+diceSize/4, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y+diceSize/4, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y-diceSize/4, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y-diceSize/4, 15, 15);
  }
  else if (dice2Value == 6)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice2X+diceSize/4, dice2Y, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y+diceSize/4, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y-diceSize/4, 15, 15);
    ellipse(dice2X-diceSize/4, dice2Y+diceSize/4, 15, 15);
    ellipse(dice2X+diceSize/4, dice2Y-diceSize/4, 15, 15);
  }
  else
  {
    stroke(diceStrokeWidth);
    fill(diceEmptyFill);
    rect(dice2X, dice2Y, diceSize, diceSize);
  }

  //Displays the side the third dice landed on

  if (dice3Value == 1)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice3X, dice3Y, 15, 15);
  }
  else if (dice3Value == 2)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice3X-diceSize/4, dice3Y-diceSize/4, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y+diceSize/4, 15, 15);
  }
  else if (dice3Value == 3)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice3X, dice3Y, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y-diceSize/4, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y+diceSize/4, 15, 15);
  }
  else if (dice3Value == 4)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice3X+diceSize/4, dice3Y+diceSize/4, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y+diceSize/4, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y-diceSize/4, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y-diceSize/4, 15, 15);
  }
  else if (dice3Value == 5)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice3X, dice3Y, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y+diceSize/4, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y+diceSize/4, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y-diceSize/4, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y-diceSize/4, 15, 15);
  }
  else if (dice3Value == 6)
  {
    fill(diceDotFill);
    stroke(diceOutline);
    ellipse(dice3X+diceSize/4, dice3Y, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y+diceSize/4, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y-diceSize/4, 15, 15);
    ellipse(dice3X-diceSize/4, dice3Y+diceSize/4, 15, 15);
    ellipse(dice3X+diceSize/4, dice3Y-diceSize/4, 15, 15);
  }
  else
  {
    stroke(diceStrokeWidth);
    fill(diceEmptyFill);
    rect(dice3X, dice3Y, diceSize, diceSize);
  }
}

void mousePressed()
{
  //rolls dice that are not restricted
  if ((mouseX > 80 && mouseX < 200 && mouseY > 160 && mouseY < 220))
  {
    if (dice1Hold == false)
    {
      dice1Value = int(random(1, 7));
    }
    if (dice2Hold == false)
    {
      dice2Value = int(random(1, 7));
    }
    if (dice3Hold == false)
    {
      dice3Value = int(random(1, 7));
    }
  }
  else
  {
    stroke(rollButtonOutline);
    fill(rollButtonFill);
    rect(rollButtonX, rollButtonY, rollButtonWidth, rollButtonHeight);
    textAlign(CENTER, CENTER);
    fill(rollButtonTextColor);
    text(rollButtonText, rollButtonX, rollButtonY);
  }
  //restrict first dice
  if ((mouseX > 40 && mouseX < 120 && mouseY> 40 && mouseY < 120))
  {
    dice1Hold = !dice1Hold;
  }
  //restrict second dice
  if ((mouseX > 180 && mouseX < 260 && mouseY> 40 && mouseY < 120))
  {
    dice2Hold = !dice2Hold;
  }
  //restrict third dice
  if ((mouseX > 320 && mouseX < 400 && mouseY> 40 && mouseY < 120))
  {
    dice3Hold = !dice3Hold;
  }
}

