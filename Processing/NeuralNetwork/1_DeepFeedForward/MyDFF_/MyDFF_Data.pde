double sigmoid(double x) { return 1.0 / (1.0 + exp(-1.0 * (float)x)); }

///////// TO USE A DATASET
// If you want to use a particular dataset, please implement the data structure in order to easily use the class MyDFF

class Data {
  
  double [] inputs, outputs;
  int label;
  
  Data() {
    // Choose your own sizes.
    inputs  = new double [1]; // The size should be equal to the number of neurons of your input layer.
    outputs = new double [1]; // The size should be equal to the number of neurons of your output layer.
  }
  
  // This method will allow you load your input data.
  // It can be either an image, an array, a path to a bynary file, ...
  void inputLoad(/*Put your own arguments*/) {
    // Do whatever you need here.
    for (int i = 0; i < inputs.length; i++) {
      /*inputs[i] = ...*/;
    }
  }
  
  // This method will allow you load your output data.
  // You will have to set with this function:
  //   - the expected value of each output neuron
  //   - the ID of the most activated neuron (label for convienency)
  void labelLoad(/*Put your own arguments*/) {
    for (int i = 0; i < outputs.length; i++) {
      /*outputs[i] = ...*/;
    }
    /*label = ...*/;
  }
}

///////// TO IMPORT A DATASET
// After implementing the previous class, you can now use it to import your own dataset.

Data [] testing_set;
Data [] training_set;

void loadData() { 
  training_set = new Data[1]; // Choose the size of the amount of training data you want to import.
  testing_set  = new Data[1]; // Choose the size of the amount of testing data you want to import.
  
  // Now, use the inputLoad() and labelLoad() for each Datas of training_set and testing_set.
  
  /*training_set[i].inputLoad();*/
  /*training_set[i].labelLoad();*/
  
  /*testing_set[i].inputLoad();*/
  /*testing_set[i].labelLoad();*/
}
