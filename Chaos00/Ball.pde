
class Ball
{
  private Vec2 pos;
  private Vec2 target;
  private Vec2 circlePos;
  private Vec2 linePos;
  private Vec2 rectPos;
  private Vec2 vec;
  private float spring = Param.spring;
  private float friction = Param.friction;
  
  Ball(Vec2 pos)
  {
    this.pos = pos;
    vec = new Vec2(0f,0f);
    target = pos;
  }
  
  public void SetTarget(char type,Vec2 pos)
  {
    if(type == 'c') circlePos = pos;
    if(type == 'l') linePos = pos;
    if(type == 'r') rectPos = pos;
  }
  
  public void SelectTarget(char type)
  {
    if(type == 'c') target = circlePos;
    if(type == 'l') target = linePos;
    if(type == 'r') target = rectPos;
  }
  
  public void MoveToTarget()
  {
    spring = Param.spring;
    Vec2 d = new Vec2(target.x - pos.x, target.y - pos.y);
    Vec2 a = new Vec2(d.x * spring, d.y * spring);
    vec.Add(a);
    vec.Scale(friction);
    pos.Add(vec);
  }
  
  public void CreatChaos(int num)
  {
    Vec2 c = new Vec2(pos);
    
    for( int i = 0; i < num; i++)
    {
      c.Distort(); c.Reversal(); c.Distort(); c.Reversal();
    }
    
    target = c;
  }
  
  public void DrawMe()
  {
    stroke(0,0,0);
    strokeWeight(1.0);
    if(!rubber.isPulled) point(pos.x, pos.y);
    else
    {
      Vec2 v = new Vec2(rubber.vec);
      v.Scale(0.1); v.Cutout(5.0);
      point(pos.x - v.x, pos.y - v.y);
    }
  }
  
  
}
