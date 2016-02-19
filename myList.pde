//  Gregory Guggenmos
//  Data Structure Safari
//  February, 10th, 2016

class myList extends Animal
{
    CursorableLinkedList dataList= new CursorableLinkedList();
    ArrayList <Prey> stomach= new ArrayList<Prey>();
    int xCounter;
    int yCounter;

  public myList (PVector initialLocation )
  {
    super(initialLocation);
  }

  public void draw(ArrayList <Prey> dataSnacks)
  {
    for (int i=numPrey-1; i>0; i--)
      {
      Prey food= dataSnacks.get(i);
      food.draw();
      if (list.isTouching(food))
        {
          if (list.location.x <(width/3*2) && list.location.x >(width/3))
          { 
            list.discardPrey(food);
          } 
       
          else 
           {
              list.eatPrey (food);
              dataSnacks.remove(i);
              numPrey--;
           }
        }
       list.drawStomach ();

      } 
    fill (155, 0, 25);
    rect(location.x, location.y, 100, 50);
  }

  public boolean isTouching(Prey p)
  {
    return (dist (location.x, location.y, p.location.x, p.location.y) < ((w/2) + (p.diameter/2)) );
  }

  public void eatPrey (Prey p)
  {
    dataList.add(p);
    stomach.add(p);
  }

  public void discardPrey (Prey p)
  {
    int index;
    index=-1;
    Prey f= (Prey) dataList.getFirst();
    if (p.c== f.c)
    {
      index++;
    }

    if (index != -1)
    {
                  println ("DISCARD");

      dataList.removeFirst(); 
      println (stomach.size());
      stomach.remove(0);
      println (stomach.size());
    }
  }

  public void drawStomach()
  {
    xCounter=310;
    yCounter= (height-50);
    for (int i=0; i < stomach.size(); i++)
      {
        Prey contents= stomach.get(i);
        contents.location.x =xCounter;
        contents.location.y =yCounter;
        xCounter+=10;
        if (xCounter==500)
        {
          xCounter=310;
          yCounter+=20;
        }
        contents.draw();
      }

  }
}
