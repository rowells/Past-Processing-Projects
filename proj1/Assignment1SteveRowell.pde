/*
Assignment Name: Assignment 1

Author(s):
Steve Rowell

File Description: This file draws a creature which 
I chose to be a dimetrodon (or rather my pathetic attempt at one)
Resources Used: processing.org

*/

size(500, 500);
background(0, 100, 200); //sky
fill(100);
beginShape(); //back plate
vertex(325, 220);
vertex(340, 140);
vertex(250, 100);
vertex(160, 140);
vertex(175, 220);
endShape();
fill( 0, 100, 0);
triangle(175, 220, 175, 280, 20, 290);
rect(175, 250, 35, 110); //legs opposite viewer
rect(300, 250, 35, 110);
ellipse(250, 250, 200, 100); //body
rect(190, 250, 35, 110);  //legs facing viewer
rect(280, 250, 35, 110);
ellipse(350, 250, 65, 45); //head
fill(0, 0, 0);
ellipse( 230, 230, 70, 30); //spots
ellipse( 270, 255, 45, 20);
ellipse(200, 260, 40, 15);
fill(256, 256, 256);
ellipse(350, 240, 20, 10); //outer eye
fill(0);
ellipse(352, 240, 10, 5); //pupil
triangle(380.5, 250, 380.5, 251, 360, 250);
fill(128, 64, 0);
rect(0, 360, 500, 140); //ground
fill(255, 255, 0);
ellipse(400, 100, 50, 50); //sun
