class MyDFF {
  
  Network _network;
  
  double _accuracy      = 0.;
  double _learningRateW = 0.01;
  double _learningRateB = 0.01;
  
  MyDFF(int nbInputs, int[] nbHiddens, int nbOutput) {
    _network = new Network(nbInputs, nbHiddens, nbOutput);
  }
  
  //// With Data Structure
  // Please see DataTreatment file to have more detailsw
  
  int respond(Data data) {
    return respond(data.inputs);
  }
  
  int train(Data [] datas) {
    if (datas.length > 0) {
      for (Data data : datas) {
        if (data.inputs.length  == _network.m_input_layer.neurons.length &&
            data.outputs.length == _network.m_output_layer.neurons.length)
        {
          _network.respond(data.inputs);
          _network.train(data.outputs, _learningRateW, _learningRateB);
        } else {
          println("MyDFF::train(Data []) method -> invalid inputs or outputs size");
          return -1;
        }
      }
    } else {
      println("MyDFF::train(Data []) method -> invalid size of the argument");
      return -1;
    }
    return 1;
  }
  
  int test(Data [] datas) {
    if (datas.length > 0) {
      int nbSuccess = 0;
      for (Data data : datas) {
        if (data.inputs.length == _network.m_input_layer.neurons.length) {
          _network.respond(data.inputs);
          
          if (_network.findIndexBestOutput() == data.label)
            nbSuccess++;
        } else {
          println("MyDFF::train(Data []) method -> invalid inputs size");
          return -1;
        }
      }
      _accuracy = (double)(nbSuccess) / (double)(datas.length);
      println("Accuracy: ", nbSuccess, " success out of ", datas.length, " i.e. ", _accuracy);
    } else {
      println("MyDFF::train(Data []) method -> invalid size of the arguments");
      return -1;
    }
    return 1;
  }
  
  //// Without Data Structure
  
  int respond(double[] inputs) {
    if (inputs.length == _network.m_input_layer.neurons.length) {
      _network.respond(inputs);
      return _network.findIndexBestOutput();
    } else {
      println("MyDFF::respond(double[]) method -> invalid size of the argument");
    }
    return -1;
  }
  
  int train(double [][] trainingInput, double [][] trainingOutput) {
    if (trainingInput.length == trainingOutput.length &&
        trainingInput[0].length == _network.m_input_layer.neurons.length &&
        trainingOutput[0].length == _network.m_output_layer.neurons.length) {
      for (int i = 0; i < trainingInput.length; i++) {
        _network.respond(trainingInput[i]);
        _network.train(trainingOutput[i], _learningRateW, _learningRateB);
      }
    } else {
      println("MyDFF::train(double[][], double[][]) method -> invalid size of the arguments");
      return -1;
    }
    return 1;
  }
  
  int test(double [][] testingInput, double [] IDofLabeledNeuron) {
    if (testingInput[0].length == _network.m_input_layer.neurons.length &&
        testingInput.length == IDofLabeledNeuron.length) {
      int nbSuccess = 0;
      for (int i = 0; i < testingInput.length; i++)
      {
        _network.respond(testingInput[i]);
        
        if (_network.findIndexBestOutput() == IDofLabeledNeuron[i])
          nbSuccess++;
      }
      _accuracy = (double)(nbSuccess) / (double)(testingInput.length);
      println("Accuracy: ", nbSuccess, " out of ", testingInput.length, " i.e. ", _accuracy);
    } else {
      println("MyDFF::test(double[][], double[]) method -> invalid size of the arguments");
      return -1;
    }
    return 1;
  }
}
