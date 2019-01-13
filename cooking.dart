import 'dart:async';

class Cake{
  
}

class Order{
  String type;
  Order(this.type);
}

void main(){
  final controller = new StreamController();
  
  final order = new Order('chocolate');
  final baker = StreamTransformer.fromHandlers(
  	handleData: (cakeType, sink){
      if(cakeType == 'chocolate'){
        sink.add(new Cake());
      }
      else{
        sink.addError('No puedo hacer este Tipo!');
      }
    }
  );
  
  controller.sink.add(order);
  
  controller.stream
    .map((order) => order.type)
    .transform(baker)
    .listen((cake)=>print('Aqui esta su queque $cake'),
          onError: (err) => print(err) 
     );
  
}

