int popSize = 1000;
int cityCount = 20;
float crossoverRate = 0.6;
float randomRate = 0.35;
float elitism = 0.05;
float mutationRate = 0.5;
Population workers = new Population();
State home = new State();
void setup(){
  size(1080,1080);
  home.init();
  workers.init();
}

void draw(){
  background(0);
  // workers.init();
  home.show(); //<>//
  workers.calcFitness(home);
  workers.calcElite();
  workers.show(home);
  workers.reproduce();
  // workers.mutate(mutationRate);
}