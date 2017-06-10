int cityCount = 10;
State home = new State();
void setup(){
  size(1080,1080);
  home.init();
}

void draw(){
  background(0);
  home.show();
}