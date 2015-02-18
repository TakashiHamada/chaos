
class Rubber
{
  private Vec2 aPos;
  private Vec2 bPos;
  
  public Vec2 vec;
  
  public boolean isPulled = false;
  
  Rubber()
  {
    aPos = new Vec2(mouseX, mouseY);
    bPos = new Vec2(mouseX, mouseY);
    ResetVec();
  }
  
  public void SetStartPos(float x, float y){
    aPos.x = x; aPos.y = y;
    bPos.x = x; bPos.y = y;
  }

  public void SetEndPos(float x, float y)
  {
    bPos.x = x; bPos.y = y;
    isPulled = true;
  }
  
  public void Draw()
  {
    float l = 30.0 - (Length() * 0.08);
    if(l < 0.5) l = 0.5;
    stroke(0,0,0,(Length() * 0.1) + 5.0);
    strokeWeight(l);
    line(aPos.x, aPos.y, bPos.x, bPos.y);
    UpdateVec();
  }
  
  private void UpdateVec()
  {
    vec = new Vec2(bPos.x - aPos.x, bPos.y - aPos.y);
  }
  
  public void ResetVec()
  {
    vec = new Vec2(0, 0);
  }
  
  public float Length()
  {
    return sqrt(pow(bPos.x - aPos.x,2) + pow(bPos.y - aPos.y,2));
  }
}
