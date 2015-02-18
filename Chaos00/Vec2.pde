
class Vec2
{
  public float x; public float y;
  
  Vec2(float x, float y)
  {
    this.x = x; this.y = y;
  }
  
  Vec2(Vec2 pos)
  {
    this.x = pos.x; this.y = pos.y;
  }
  
  public void Add(Vec2 a)
  {
    x += a.x;
    y += a.y;
  }
  
  public void Scale(float s)
  {
    x *= s; y *= s;
  }
  
  public void Inflate(float m)
  {
    float dx  = (width  / 2) - this.x;
    float dy  = (height / 2) - this.y;
    x += dx * (1 - m); y += dy * (1 - m);
  }
  
  public void Reversal()
  {
    float x = this.x; this.x  = this.y; this.y  = x;
  }
  
  public void Distort()
  {
    y = y + Param.a * (cos(x * Param.b));
  }
  
  public void Cutout(float l)
  {
    if(x > 0){ x -= l; if(x < 0) x = 0;}
    else{ x += l; if(x > 0) x = 0;}
    if(y > 0){ y -= l; if(y < 0) y = 0;}
    else{ y += l; if(y > 0) y = 0;}
  }
  
  public boolean isInArea(float minX,float minY,float maxX,float maxY)
  {
    return (minX < x && x < maxX && minY < y && y < maxY)? true:false;
  }
}
