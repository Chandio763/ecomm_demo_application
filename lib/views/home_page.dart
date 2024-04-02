
import 'package:ecomm_demo_application/controllers/counter_controller.dart';
import 'package:ecomm_demo_application/views/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<CounterController>(
              builder: (controller) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            ),
            ElevatedButton(onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>const SecondScreen())));
            }, child: const Text('Second Screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
