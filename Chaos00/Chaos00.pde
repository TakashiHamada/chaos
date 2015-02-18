
Stage stage;
GUI gui;
Rubber rubber;
Ripple ripple;

void setup()
{ 
  size(600,600);
  colorMode(HSB,360,100,100,100);
  smooth();
  background(0,0,0);
  frameRate(30);
  
  stage = new Stage();
  gui = new GUI();
  rubber = new Rubber();
}

void draw()
{
  stage.Clear();
  stage.Update();
  gui.Update();
  
  if(ripple != null) ripple.Update();
  
  if(rubber.isPulled) rubber.Draw();
  if(!mousePressed) stage.AddCounter();
}

void mousePressed()
{
  if(!rubber.isPulled)
  {
    rubber.SetStartPos(mouseX, mouseY);
    rubber.isPulled = true;
  }
}

void mouseDragged()
{
  rubber.SetEndPos(mouseX, mouseY);
  stage.ResetCounter();
}


void mouseReleased()
{
  if(rubber.Length() > 2)
  {
    Param.spring = rubber.Length() * 0.0001;
    stage.Process();
  }
  else
  {
    ripple = new Ripple(mouseX, mouseY);
    stage.Reset(1.0);
  }
  
  rubber.ResetVec();
  rubber.isPulled = false;
}
