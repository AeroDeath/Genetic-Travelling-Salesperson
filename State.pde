class State{
  City[] cities = new City[cityCount];
  
  void init(){
    for(int i = 0; i<cityCount; i++){
      cities[i] = new City();
      cities[i].init();
    }
    }
    
    void show(){
      for(int i = 0; i<cityCount; i++){
        cities[i].show();
      }
    }
}