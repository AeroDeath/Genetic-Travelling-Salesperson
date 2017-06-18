class City{
  PVector location = new PVector();
  
  void init(){
    this.location.x = 15 + floor(random(width -15));
    this.location.y = 15 + floor(random(height - 15));
  }
  
  void show(){
    fill(255, 130);
    stroke(255);
    ellipse(this.location.x, this.location.y, 30,30);
  }
  
  
}