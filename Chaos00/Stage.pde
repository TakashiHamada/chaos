
class Stage
{
  private ArrayList<Ball> balls;
  private char[] mode = {'c','l','r'};
  private int previousModeNum = -1;
  
  private int waitTimeCounter = 0;
  private boolean isInitPosition = true;
  
  Stage()
  {
    balls  = new ArrayList<Ball>(0);
    SetBalls();
    Reset(1.0);
  }
  
  public void Clear()
  {
    noStroke();
    if(!mousePressed) fill(360,0,100,100);
    else fill(360,0,100,60);
    rect(0,0,width,height);
  }
  
  public void AddCounter()
  {
    if(!isInitPosition) waitTimeCounter ++;
  }
  public void ResetCounter(){ waitTimeCounter = 0;}
  
  private void SetBalls()
  {
    for(int i = 0; i < Param.totalBallCount; i++)
    {
      Ball b = new Ball(new Vec2(width/2,height/2));
      balls.add(b);
    }
    
    SetTargetCircle();
    SetTargetLine();
    SetTargetRect();
  }
  
  private void SetTargetCircle()
  {
    float degree = 360 / Param.totalBallCount;
    for(int i = 0; i < Param.totalBallCount; i++)
    {
      float d = (degree * i) / 180 * PI;
      float r = 110;
      
      Ball b = balls.get(i);
      b.SetTarget('c', new Vec2(cos(d) * r + width  / 2,sin(d) * r + height / 2));
    }
  }
  
  private void SetTargetLine()
  {
    float interval = width / Param.totalBallCount;
    
    for(int i = 0; i < Param.totalBallCount; i++)
    {
      Ball b = balls.get(i);
      b.SetTarget('l', new Vec2(interval * i,height/2));
    }
  }
  
  private void SetTargetRect()
  {
    int pointsOnSide = int(Param.totalBallCount / 4);
    float len = 200.0;
    float interval = (len * 2) / pointsOnSide;
    
    float left = (width  / 2) - len; float right = (width  / 2) + len;
    float top  = (height / 2) - len; float down = (height / 2) + len;
    
    for(int i = 0; i < pointsOnSide; i++)
    {
      Ball b = balls.get(i);
      b.SetTarget('r', new Vec2(left + (interval*i), top));
    }
    
    for(int i = 0; i < pointsOnSide; i++)
    {
      Ball b = balls.get(i + (pointsOnSide * 1));
      b.SetTarget('r', new Vec2(right, top + (interval*i)));
    }
    
    for(int i = 0; i < pointsOnSide; i++)
    {
      Ball b = balls.get(i + (pointsOnSide * 2));
      b.SetTarget('r', new Vec2(right - (interval*i), down));
    }
    
    for(int i = 0; i < pointsOnSide; i++)
    {
      Ball b = balls.get(i + (pointsOnSide * 3));
      b.SetTarget('r', new Vec2(left, down - (interval*i)));
    }
  }
  
  public void Update()
  {
    for(Ball ball : balls)
    {
      ball.MoveToTarget();
      ball.DrawMe();
    }
    
    if(waitTimeCounter > 120)
    {
      Reset(0.1);
      waitTimeCounter = 0;
    }
  }
  
  public void Process()
  {
    isInitPosition = false;
    int num = int(rubber.Length() * 0.1);  
    Param.a = random(Param.aMin, Param.aMax);
    Param.b = random(Param.bMin, Param.bMax);
    for(Ball ball : balls) ball.CreatChaos(num);
  }
  
  public void Reset(float f)
  {
    isInitPosition = true;
    Param.spring = random(Param.sMin * f, Param.sMax *f);
    int i = 0;
    while(i == previousModeNum) i = int(random(0,3));
    for(Ball ball : balls) ball.SelectTarget(mode[i]);
    previousModeNum = i;
  }
}
