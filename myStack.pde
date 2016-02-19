//  Gregory Guggenmos
//  Data Structure Safari
//  February, 10th, 2016

class myStack extends Animal
{
    ArrayStack dataStack= new ArrayStack();
    ArrayList <Prey> stomach= new ArrayList<Prey>();
    int xCounter;
    int yCounter;

  public myStack (PVector initialLocation )
  {
    super(initialLocation);
  }

  public void draw(ArrayList <Prey> dataSnacks)
  {
    for (int i=numPrey-1; i>0; i--)
      {
      Prey food= dataSnacks.get(i);
      food.draw();
      if (stack.isTouching(food))
        {
          if (stack.location.x <(width/3*2) && stack.location.x >(width/3))
          { 
            stack.discardPrey(food);
          } 
       
          else 
           {
              stack.eatPrey (food);
              dataSnacks.remove(i);
              numPrey--;
           }
        }
       stack.drawStomach ();

      } 
    fill (10, 155, 25,80);
    rect(location.x, location.y, 50, 100);
  }

  public boolean isTouching(Prey p)
  {
    return (dist (location.x, location.y, p.location.x, p.location.y) < ((w/2) + (p.diameter/2)) );
  }

  public void eatPrey (Prey p)
  {
    dataStack.push(p);
    stomach.add(p);
  }

  public void discardPrey (Prey p)
  {
    int index;
    index=-1;
    if (!dataStack.isEmpty())
    {
      Prey f= (Prey) dataStack.peek();
      if (p.c== f.c)
      {
        index++;
      }

      if (index != -1)
      {
                    println ("DISCARD");

        dataStack.pop(); 
        println (stomach.size());
        stomach.remove(0);
        println (stomach.size());
      }
    }
  }

  public void drawStomach()
  {
    xCounter=750;
    yCounter= (height-140);
    for (int i=0; i < stomach.size(); i++)
      {
        Prey contents= stomach.get(i);
        contents.location.x =xCounter;
        contents.location.y =yCounter;
        yCounter+=10;
        if (yCounter==height-10)
        {
          yCounter=height-140;
          xCounter+=20;
        }
        contents.draw();
      }

  }
}