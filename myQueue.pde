//  Gregory Guggenmos
//  Data Structure Safari
//  February, 10th, 2016

class myQueue extends Animal
{
    CircularFifoQueue dataQueue= new CircularFifoQueue();
    ArrayList <Prey> stomach= new ArrayList<Prey>();
    int xCounter;
    int yCounter;

  public myQueue (PVector initialLocation )
  {
    super(initialLocation);
  }

  public void draw(ArrayList <Prey> dataSnacks)
  {
    for (int i=numPrey-1; i>0; i--)
      {
      Prey food= dataSnacks.get(i);
      food.draw();
      if (queue.isTouching(food))
        {
          if (queue.location.x <(width/3*2) && queue.location.x >(width/3))
          { 
            queue.discardPrey(food);
          } 
       
          else 
           {
              queue.eatPrey (food);
              dataSnacks.remove(i);
              numPrey--;
           }
        }
       queue.drawStomach ();

      } 
    fill (25, 25, 200);
    rect(location.x, location.y, 100, 50);
  }

  public boolean isTouching(Prey p)
  {
    return (dist (location.x, location.y, p.location.x, p.location.y) < ((w/2) + (p.diameter/2)) );
  }

  public void eatPrey (Prey p)
  {
    dataQueue.add(p);
    stomach.add(p);
  }

  public void discardPrey (Prey p)
  {
    int index;
    index=-1;
    if (!dataQueue.isEmpty())
    {
      Prey f= (Prey) dataQueue.peek();
      if (p.c== f.c)
      {
        index++;
      }

      if (index != -1)
      {
                    println ("DISCARD");

        dataQueue.remove(); 
        println (stomach.size());
        stomach.remove(0);
        println (stomach.size());
      }
    }
  }

  public void drawStomach()
  {
    xCounter=910;
    yCounter= (height-50);
    for (int i=0; i < stomach.size(); i++)
      {
        Prey contents= stomach.get(i);
        contents.location.x =xCounter;
        contents.location.y =yCounter;
        xCounter+=10;
        if (xCounter==1180)
        {
          xCounter=910;
          yCounter+=20;
        }
        contents.draw();
      }

  }
}
