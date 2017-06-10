class City{
  PVector location = new PVector();
  
  void init(){
    this.location.x = floor(random(width));
    this.location.y = floor(random(height));
  }
  
  void show(){
    fill(255, 130);
    ellipse(this.location.x, this.location.y, 30,30);
  }
}