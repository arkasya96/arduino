int UD = 0;
int LR = 0;
#include "LedControl.h" //  need the library
LedControl lc=LedControl(12,11,10,1); // 

// pin 12 is connected to the MAX7219 pin 1
// pin 11 is connected to the CLK pin 13
// pin 10 is connected to LOAD pin 12
// 1 as we are only using 1 MAX7219
 
void setup()
{
  // the zero refers to the MAX7219 number, it is zero for 1 chip
  lc.shutdown(0,false);// turn off power saving, enables display
  lc.setIntensity(0,8);// sets brightness (0~15 possible values)
  lc.clearDisplay(0);// clear screen
}
void loop()
{
 UD = analogRead(A0);
 LR = analogRead(A1);
 char x_translate = map(LR, 1021, 0, 0, 7); //This maps the values//
 char y_translate = map(UD, 1021, 0, 0, 7);
 lc.clearDisplay(0);
 lc.setLed(0,x_translate,y_translate,true);
 delay(150); //adjust delay to get your joystick correct//
  /*for (int row=0; row<8; row++)
  {
    for (int col=0; col<8; col++)
    {
      lc.setLed(0,col,row,true); // turns on LED at col, row
      delay(25);
    }
  }

 */
 /* for (int row=0; row<8; row++)
  {
    for (int col=0; col<8; col++)
    {
      lc.setLed(0,col,row,false); // turns off LED at col, row
      delay(25);
    }
  }
  */
  
}