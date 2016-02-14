// TODO Gregory Guggenmos
// TODO Data Structure Safari
// February, 10th, 2016

Bag bag;
Animal animal;
int numColors=5;
int numPrey=50;
ArrayList <Prey> dataSnacks= new ArrayList<Prey>();
color [] colors = new color[numColors];

void setup() {
  size(1400, 1000);
  bag = new Bag(new PVector(10, height / 2));
  for (int i=0; i< numColors; i++)
  {
  	colors[i]= color ((int)random(0,numColors));
  }
  for (int i=0; i < numPrey; i++)
  {
  	PVector l= new PVector (random(0,height), random (0,width));
  	color c=  colors [(int)(random (0,numColors))];
  	dataSnacks.add (new Prey (l, c));
  }
}

void draw() {
  background(55);
  for (int i=0; i< numPrey; i++)
  	{
		Prey food= dataSnacks.get(i);
		food.draw();
 	} 
  // animal.draw()
  bag.walk();
  bag.draw();
}


// ---
class Animal {
final int MAX_VELOCITY = 1;
  final float NOISE_DELTA = 0.01;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency;
  float xOffset;

  public Animal(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(1.4, 0);
    xOffset = 0.0;
  }

  public void walk() {
    acceleration = PVector.fromAngle( noise(xOffset) * TWO_PI  );
    velocity.add(acceleration);
    velocity.add(tendency);
    location.add(velocity);
    velocity.limit(MAX_VELOCITY);
    xOffset += NOISE_DELTA;
    if (location.y < 0) location.y = height;
    if (location.y > height) location.y = 0;
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
  }

  void draw() {
    stroke(150, 20, 0);
    ellipse(location.x, location.y, 100, 100);
  }
}

class Prey 
{
	PVector location;
	color c;
	int diameter;

	public Prey (PVector initialLocation, color c)
	{
		location= initialLocation;
		this.c=c;
		diameter=20;
	}

	void draw ()
	{
		fill (c);
		ellipse (location.x, location.y, diameter, diameter);
	} 
}
//--------

class Bag extends Animal
{
  
	public Bag (PVector initialLocation )
	{
		super(initialLocation);
	}

void draw()
  {
    stroke(150, 200, 50);
    fill (200,50, 10);
    ellipse(location.x, location.y, 100, 100);
  }
}

class Stack extends Animal
{
	public Stack (PVector initialLocation )
	{
		super(initialLocation);
	}
	void draw()
  {
    stroke(150, 20, 0);
    rect(location.x, location.y, 100, 100);
  }
}





