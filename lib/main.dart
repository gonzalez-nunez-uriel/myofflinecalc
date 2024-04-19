import 'package:flutter/material.dart';
// I'm back
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  static const rowWidth = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Offline Calculator'),
        ),
        body: const MyHomePage()
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable holding the current calculation displayed to the user
  // Is this the way you set initial state?
  String _calculation = "Please enter calculation";

  /*
  void _updateCalculation() {
    setState(() {
      // Changes in the calculation displayed go here
    });
  }*/

  @override
  Widget build(BuildContext context) {
    
    return Column(
          children: [
            Text(_calculation),
            buildRow(['7', '8', '9', 'clr']),
            buildRow(['4', '5', '6', '+']),
            buildRow(['1', '2', '3', '-']),
            buildRow(['0']),
            buildButton('Enter')
          ],
        );      
  }

  TextButton buildButton(String textContent) {
    return TextButton(
      onPressed: (){},
      child: Text(
        textContent,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black
        ),
      ),
    );
  }

  Row buildRow(List<String> textContents){

    List<TextButton> buttons = List.empty(growable: true);

    for(int i = 0; i < textContents.length; i++) {
      buttons.add(buildButton(textContents[i]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }
}
