import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider<Counter>
    (create: (_)=>Counter())],

    child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context ) {
    final provider= Provider.of<Counter>(context);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('${provider.count}'),

        ),
        floatingActionButton: FloatingActionButton(onPressed: (){provider.Increment();},
        child: Icon(Icons.add),),

      ),
    );

  }
}
class Counter with ChangeNotifier{
  int _count=0;

  int get count => _count;
  void Increment()
  {
    _count++;
   notifyListeners();
  }
}