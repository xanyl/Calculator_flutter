import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            return buttonColor;
          }),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
              
                  children: [
                    buildButton("7", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("8", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("9", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("/", const Color.fromARGB(255, 165, 164, 164)),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("5", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("6", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("X", const Color.fromARGB(255, 165, 164, 164)),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("2", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("3", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("-", const Color.fromARGB(255, 165, 164, 164)),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("0", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("00", const Color.fromARGB(255, 93, 97, 99)),
                    buildButton("+", const Color.fromARGB(255, 165, 164, 164)),
                  ],
                ),
                Row(
                  children: [
                    buildButton("AC", Colors.red),
                    buildButton("=", const Color.fromARGB(255, 165, 164, 164)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
