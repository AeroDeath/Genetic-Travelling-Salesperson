void shuffle(char[] array){
  int posToSwap = 0;
  int point = array.length - 1;
  char temp = 'a';
  for(int i = 0; i<array.length; i++){
    posToSwap = floor(random(0,array.length));
    temp = array[posToSwap];
    array[posToSwap] = array[point];
    array[point] = temp;
    point--;
  }
}

void shuffle(int[] array){
  int posToSwap = 0;
  int point = array.length - 1;
  int temp = 0;
  for(int i = 0; i<array.length; i++){
    posToSwap = floor(random(0,array.length));
    temp = array[posToSwap];
    array[posToSwap] = array[point];
    array[point] = temp;
    point--;
  }
}