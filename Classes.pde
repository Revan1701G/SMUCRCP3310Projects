class Animal {
final int MAX_VELOCITY = 1;
  final float NOISE_DELTA = 0.01;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency;
  float xOffset;
  int w=100;
  int h=100;

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
    if (location.y < 0) location.y = height-150;
    if (location.y > height-150) location.y = 0;
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
  }

  void draw() {
    stroke(150, 20, 0);
    ellipse(location.x, location.y, w, h);
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

class myBag extends Animal
{
  
  public myBag (PVector initialLocation )
  {
    super(initialLocation);
    HashBag data = new HashBag();
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
