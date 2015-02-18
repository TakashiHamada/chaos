
class GUI
{
  GUI()
  {
    SetupFont();
  }
  
  public void Update()
  {
    Infomation();
  }
  
  private void Infomation()
  {
    fill(0,0,0);
    //text("a =",  10, height-8);   text(Param.a,  30, height-8); 
    //text("b =", 100, height-8);   text(Param.b, 120, height-8); 
    text("2014  Takashi Hamada", 10, height - 8);
  }
  
  private void SetupFont()
  {
    PFont myFont;
    myFont = createFont("helvetica", 12);
    textFont(myFont);
  }
}
