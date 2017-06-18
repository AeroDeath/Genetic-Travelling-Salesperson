class Population{
  DNA[] individuals = new DNA[popSize];
  float[] fitness = new float[popSize];
  float[] selectionArray = new float[popSize];
  FloatDict elitists = new FloatDict();
  
  void init(){
    for(int i = 0; i<popSize; i++){
      this.individuals[i] = new DNA();
      this.individuals[i].init();
    }
  }
  
  
  void show(State state){
    getElite(1)[0].show(state);
    println(getElite(1)[0].fitness(home));
  }
  
  void calcFitness(State state){
    float sum = 0;
    for(int i = 0; i<popSize; i++){
      this.fitness[i] = this.individuals[i].fitness(state);
      sum += this.fitness[i];
      this.selectionArray[i] = sum;
    }
    for(int i =0; i<popSize;i++){
      // this.fitness[i]/=sum;
      this.selectionArray[i]/=sum;
    }
  }
  
  void calcElite(){
    for(int i =0; i<popSize;i++){
      this.elitists.set(str(i), this.fitness[i]);
    }
    
    this.elitists.sortValuesReverse();
  }
  
  DNA[] getElite(int number){
    DNA[] elite = new DNA[number];
    String[] keys = this.elitists.keyArray();
    for(int i = 0; i< number; i++){
      elite[i] = this.individuals[Integer.parseInt(keys[i])];
    }
    return elite;
  }
  
  void mutate(float mutationRate){
    for(int i =0; i<popSize; i++){
      this.individuals[i].mutate(mutationRate);
    }
  }
  
  void reproduce(){
    DNA[] nextGen = new DNA[popSize];
    DNA father = new DNA();
    DNA mother = new DNA();
    int number = round(popSize*elitism);
    int randCutoff = round(popSize*(elitism+randomRate));
    DNA[] elite = getElite(number);
    
    for(int i =0; i<popSize; i++){
      if(i<number){
        nextGen[i] = new DNA();
        nextGen[i].init();
        nextGen[i] = elite[i];
      }
      
      else if(i<randCutoff){
        nextGen[i] = new DNA();
        nextGen[i].init();
      }
      
      else{
        float decision_dad = random(1);
        float decision_mom = random(1);
        boolean dadMissing = true;
        boolean momMissing = true;
        for(int j = 0; j<popSize;j++){
          if((decision_dad<selectionArray[j]) && dadMissing){
            father = this.individuals[j];
            dadMissing = false;
          }
          if((decision_mom<random(1)) && momMissing){
            mother = this.individuals[j];
            momMissing = false;
          }
        }
        nextGen[i] = father.crossover(mother);
        nextGen[i].mutate(mutationRate);
      }
    }
    this.individuals = nextGen;
  }
}