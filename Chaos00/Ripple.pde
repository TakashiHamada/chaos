
class Ripple
{
  private Vec2 pos;
  private float radius = 200.0; 
  
  Ripple(float x, float y)
  {
    pos = new Vec2(x, y);
  }
  
  public void Update()
  {
    if(radius <= 0.0) return;
    
    DrawMe();
    radius -= 20.0;
  }

  private void DrawMe()
  {
    noStroke();
    fill(0,0,0, 20 - (radius * 0.1));
    //ellipse(pos.x, pos.y , radius, radius);
    rect(pos.x - radius/2,pos.y - radius/2, radius, radius);
    rect(pos.x - radius/4,pos.y - radius/4, radius/2, radius/2);
  }
   
}
