//  Gregory Guggenmos
//  Data Structure Safari
//  February, 10th, 2016

class myBag extends Animal
{
  HashBag data = new HashBag();
  ArrayList <Prey> stomach= new ArrayList<Prey>();


  public myBag (PVector initialLocation )
  {
    super(initialLocation);
  }

  public void draw(ArrayList <Prey> dataSnacks)
  {
    for (int i=numPrey-1; i>0; i--)
      {
      Prey food= dataSnacks.get(i);
      food.draw();
      if (bag.isTouching(food))
        {
          if (bag.location.x <(width/3*2) && bag.location.x >(width/3))
          { 
            bag.discardPrey(food);
          } 
       
          else 
           {
              bag.eatPrey (food);
              dataSnacks.remove(i);
              numPrey--;
           }
        }
       bag.drawStomach ();

      } 
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
    stomach.add(p);
  }

  public void discardPrey (Prey p)
  {
    int index;
    index=-1;
    for (int i=(stomach.size()-1); i >0; i--)
    {
    if (stomach.get(i).c== p.c)
       index=i;
    }
    if (index != -1)
    {
                  println ("DISCARD");

      data.remove(p); 
      println (stomach.size());
      stomach.remove(index);
      println (stomach.size());
    }
  }

  public void drawStomach()
  {
    for (int i=0; i < stomach.size(); i++)
      stomach.get(i).draw();
  }

}

