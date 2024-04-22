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
  String _calculation = 'Please enter calculation';
  bool inProgress = false;

  
  void _updateCalculation(String digit) {
    setState(() {
      if(!inProgress) {
        inProgress = true;
        _calculation = digit;
      } else {
        _calculation += digit;
      }
    });
  }

  void _clearCalculation() {
    setState(() {
      inProgress = false;
      _calculation = 'Please enter calculation';
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
          children: [
            Text(_calculation),
            buildFirstRow(),
            buildSecondRow(),
            buildThirdRow(),
            buildFourthRow(),
            buildEnterButton()
          ],
        );      
  }

  TextButton buildDigitButton(String textContent) {
    return TextButton(
      onPressed: (){
        _updateCalculation(textContent);
      },
      child: Text(
        textContent,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black
        ),
      ),
    );
  }

  TextButton buildEnterButton() {
    return TextButton(
      onPressed: (){
        // TODO
      },
      child: const Text(
        'Enter',
        style: TextStyle(
          fontSize: 12,
          color: Colors.black
        ),
      ),
    );
  }

  TextButton buildClearButton() {
    return TextButton(
      onPressed: (){
        _clearCalculation();
      },
      child: const Text(
        'CLR',
        style: TextStyle(
          fontSize: 12,
          color: Colors.black
        ),
      ),
    );
  }

  Row buildRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ,
    );
  }
}
