//  Gregory Guggenmos
//  Data Structure Safari
//  February, 10th, 2016
import org.apache.commons.collections4.*;

  Animal animal;
  myBag bag = new myBag(new PVector(10, height / 2));
  myList list= new myList(new PVector(10, height / 2));
  myStack stack=new myStack(new PVector(10, height / 2));
  myQueue queue=new myQueue(new PVector(10, height / 2));


  //myList list= new myList (new PVector(10, height / 2));
int numColors=5;
int numPrey=50;
ArrayList <Prey> dataSnacks= new ArrayList<Prey>();
color [] colors = new color[numColors];
int whichDS;


void setup() {
  size(1200, 600);
  whichDS=0;
  for (int i=0; i< numColors; i++)
  {
  	colors[i]= color (random(0,255), random (0,255), random (0,255));
  }
  for (int i=0; i < numPrey; i++)
  {
  	PVector l= new PVector (random(0,1200), random (0,height-150));
  	color c=  colors [(int)(random (0,numColors))];
  	dataSnacks.add (new Prey (l, c));
  }
}

void draw() 
  {
    background(55);

    if (mousePressed == true) 
    {
      whichDS++;
    }
    whichDS= (whichDS % 4);
    drawSafari();

    if (whichDS==0)
    {
      queue.walk();
      queue.draw(dataSnacks);
    }
     if (whichDS==1)
    {
    list.walk();
    list.draw(dataSnacks);
    }
     if (whichDS==2)
    {
    stack.walk();
    stack.draw(dataSnacks);
    }
     if (whichDS==3)
    {
    bag.walk();
    bag.draw(dataSnacks);
    }
  
  }

void drawSafari ()
{
  stroke (122);

  line (0, (height-150), width, (height-150));
  line ((width/3), (height-150), (width/3), 0);
  line ((width/3*2), (height-150), (width/3*2), 0);


  fill (122, 55, 25, 80);
  rect (0, height-150, 300, height);
  fill (155, 0, 25,80);
  rect (300, height-150, 300, height);
  fill (10, 155, 25,80);
  rect (600, height-150, 300, height);
  fill (25, 25, 200,80);
  rect (900, height-150, 300, height);

}
