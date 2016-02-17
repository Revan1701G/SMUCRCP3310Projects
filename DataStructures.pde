class myBag extends Animal
{
  HashBag data = new HashBag();

  public myBag (PVector initialLocation )
  {
    super(initialLocation);
  }

  public void draw()
  {
    fill (122, 55, 25);
    ellipse(location.x, location.y, 100, 100);
  }

  public boolean isTouching(Prey p)
  {
    return (dist (location.x, location.y, p.location.x, p.location.y) < ((w/2) + (p.diameter/2)) );
  }

  public void eatPrey (Prey p)
  {
    data.add(p);
    p.location.x=random (0,300);
    p.location.y= random (height-150, height);
  }

}

class myStack extends Animal
{
  public myStack (PVector initialLocation )
  {
    super(initialLocation);
  }
  void draw()
  {
    stroke(150, 20, 0);
    rect(location.x, location.y, 100, 100);
  }
}
