import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNumber = 0;
  int secondNumber = 0;
  String history = '';
  String textToDisplay = '';
  String result = '';
  String operation = '';

  String split0double(double x) {
    return (x.toString().split(".")[0]).toString();
  }

  void btnOnClick(String value) {
    print(value);
    if (value == "AC") {
      textToDisplay = "";
      firstNumber = 0;
      secondNumber = 0;
      history = "";
      result = "";
    } else if (value == "+/-") {
      textToDisplay = (int.parse(textToDisplay) * -1).toString();
      result = textToDisplay.toString();
      print(textToDisplay);
    } else if (value == "%") {
      textToDisplay = (int.parse(textToDisplay) / 100).toString();
      result = textToDisplay.toString();
      print(textToDisplay);
    } else if (value == ".") {
      if (!textToDisplay.contains(".")) {
        textToDisplay += value;
        result = textToDisplay.toString();
        print(textToDisplay);
      }
    } else if (value == "+" || value == "-" || value == "*" || value == "/") {
      firstNumber = int.parse(textToDisplay);
      operation = value;
      history = textToDisplay + operation;
      result = "";
    } else if (value == "=") {
      secondNumber = int.parse(textToDisplay);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      } else if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      } else if (operation == "*") {
        result = (firstNumber * secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      } else if (operation == "/") {
        result = (firstNumber / secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    } else {
      result = int.parse(textToDisplay + value).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(history,
                      style: TextStyle(
                          color: Color.fromARGB(255, 109, 108, 108),
                          fontSize: 24))),
              alignment: Alignment(1, 1),
            ),
            Container(
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(result,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 48))),
              alignment: Alignment(1, 1),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: 'AC',
                  onPressed: btnOnClick,
                  color: [255, 159, 159, 159],
                  textColor: [255, 0, 0, 0]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '+/-',
                  onPressed: btnOnClick,
                  color: [255, 159, 159, 159],
                  textColor: [255, 0, 0, 0]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '%',
                  onPressed: btnOnClick,
                  color: [255, 159, 159, 159],
                  textColor: [255, 0, 0, 0]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '/',
                  onPressed: btnOnClick,
                  color: [255, 246, 153, 6],
                  textColor: [255, 255, 255, 255]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '7',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '8',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '9',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '*',
                  onPressed: btnOnClick,
                  color: [255, 246, 153, 6],
                  textColor: [255, 255, 255, 255]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '4',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '5',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '6',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '-',
                  onPressed: btnOnClick,
                  color: [255, 246, 153, 6],
                  textColor: [255, 255, 255, 255]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '1',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '2',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '3',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '+',
                  onPressed: btnOnClick,
                  color: [255, 246, 153, 6],
                  textColor: [255, 255, 255, 255]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '0',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 70,
                  height: 70,
                  text: '00',
                  onPressed: btnOnClick,
                  color: [255, 49, 49, 49],
                  textColor: [255, 255, 255, 255]),
              CalculatorButton(
                  width: 170,
                  height: 70,
                  text: '=',
                  onPressed: btnOnClick,
                  color: [255, 246, 153, 6],
                  textColor: [255, 255, 255, 255]),
            ]),
          ]),
        ));
  }
}
