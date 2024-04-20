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
            buildRowCustomBtns(['7', '8', '9'], [buildClearButton(textContent)]]),
            buildRow(['4', '5', '6', '+']),
            buildRow(['1', '2', '3', '-']),
            buildRow(['0']),
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

  TextButton buildClearButton(String textContent) {
    return TextButton(
      onPressed: (){
        _clearCalculation();
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

  // the sp version is used only to impl the row with CLEAR
  Row buildRowCustomBtns(List<String> textContents, List<TextButton>? others){

    List<TextButton> buttons = List.empty(growable: true);

    for(int i = 0; i < textContents.length; i++) {
      buttons.add(buildDigitButton(textContents[i]));
    }

    if(others != null) {
      for(int i = 0; i < others.length; i++) {
        buttons.add(others[i]);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }

  // A normal one and a special one
  Row buildRow(List<String> textContents) {
    List<TextButton> buttons = List.empty(growable: true);

    for(int i = 0; i < textContents.length; i++) {
      buttons.add(buildDigitButton(textContents[i]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }
}
