class DNA{
  int[] chromosome = new int[cityCount];
  
  void init(){
    for(int i=0; i<cityCount; i++){
      this.chromosome[i] = i;
    }
    shuffle(this.chromosome);
  }
  void copyChromosome(DNA child){
    for(int i = 0; i<cityCount; i++)
    this.chromosome[i] = child.chromosome[i];
  }
  
  void show(State state){
    for(int i = 0; i<cityCount-1;i++){
      stroke(0,255,0,120);
      line(state.cities[this.chromosome[i]].location.x, state.cities[this.chromosome[i]].location.y, state.cities[this.chromosome[i+1]].location.x, state.cities[this.chromosome[i+1]].location.y);
    }
  }
  
  float fitness(State state){
    //
    float distance = 0;
    for(int i = 0; i<cityCount-1;i++){
      distance+= state.cities[this.chromosome[i]].location.dist(state.cities[this.chromosome[i+1]].location);
      
    }
    return pow(1/distance, 2);
  }
  
  DNA crossover(DNA parent){
    DNA child = new DNA();
    child.init();
    //child.copyChromosome(parent);
    for(int i =0; i<cityCount; i++){
      child.chromosome[i] = this.chromosome[i];
    }
    int splitPoint = floor(random(cityCount));
    for(int i = 0; i<splitPoint; i++){
      for(int j=0; j<cityCount; j++){
        if(parent.chromosome[i] == child.chromosome[j]){
          child.chromosome[j] = child.chromosome[i];
          child.chromosome[i] = parent.chromosome[i];
        }
      }
    }
    
    return child;
  }
  
  void mutate(float mutationRate){
    int temp;
    for(int i=0; i<cityCount-1; i++){
      if(random(1) < mutationRate){
        temp = this.chromosome[i];
        this.chromosome[i] = this.chromosome[i+1];
        this.chromosome[i+1] = temp;
      }
    }
  }
  
}