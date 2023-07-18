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
        brightness: Brightness.dark,
      ),
      home: const CalcIndex(),
    );
  }
}

class CalcIndex extends StatefulWidget {
  const CalcIndex({Key? key}) : super(key: key);

  @override
  _CalcIndexState createState() => _CalcIndexState();
}

class _CalcIndexState extends State<CalcIndex> {
  TextEditingController textEditingController = TextEditingController();
  double firstInt = 0;
  double SecInt = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic operator = '';
  dynamic preOpr = '';

  void executeCalc(String TextBT) {
    setState(() {
      if (TextBT == 'AC') {
        textEditingController.text = '0';
        firstInt = 0;
        SecInt = 0;
        result = '';
        finalResult = '0';
        operator = '';
        preOpr = '';
      } else if (operator == '=' && TextBT == '=') {
        if (preOpr == '+') {
          finalResult = add();
        } else if (preOpr == '-') {
          finalResult = sub();
        } else if (preOpr == 'x') {
          finalResult = mul();
        } else if (preOpr == '÷') {
          finalResult = div();
        }
      } else if (TextBT == '+' ||
          TextBT == '-' ||
          TextBT == 'x' ||
          TextBT == '÷' ||
          TextBT == '=') {
        if (firstInt == 0) {
          firstInt = double.parse(result);
        } else {
          SecInt = double.parse(result);
        }

        if (operator == '+') {
          finalResult = add();
        } else if (operator == '-') {
          finalResult = sub();
        } else if (operator == 'x') {
          finalResult = mul();
        } else if (operator == '÷') {
          finalResult = div();
        }
        preOpr = operator;
        operator = TextBT;
        result = '';
      } else if (TextBT == '%') {
        result = (firstInt / 100).toString();
        finalResult = hasDecimal(result);
      } else if (TextBT == '.') {
        if (!result.toString().contains('.')) {
          result = result.toString() + '.';
        }
        finalResult = result;
      } else if (TextBT == '+/-') {
        result.toString().startsWith('-')
            ? result = result.toString().substring(1)
            : result = '-' + result.toString();
        finalResult = result;
      } else {
        result = result + TextBT;
        finalResult = result;
      }
      textEditingController.text = finalResult;
    });
  }

  String add() {
    result = (firstInt + SecInt).toString();
    firstInt = double.parse(result);
    return hasDecimal(result);
  }

  String sub() {
    result = (firstInt - SecInt).toString();
    firstInt = double.parse(result);
    return hasDecimal(result);
  }

  String mul() {
    result = (firstInt * SecInt).toString();
    firstInt = double.parse(result);
    return hasDecimal(result);
  }

  String div() {
    result = (firstInt / SecInt).toString();
    firstInt = double.parse(result);
    return hasDecimal(result);
  }

  String hasDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculator"),
        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      ),
      body: Column(
        children: [
          Container(
            width: 350,
            height: 167,
            margin: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              textEditingController.text,
              style: const TextStyle(fontSize: 60, color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 165, 165, 165),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("AC");
                  },
                  child: const Text(
                    'AC',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 165, 165, 165),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("+/-");
                  },
                  child: const Text(
                    '+/-',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 165, 165, 165),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("%");
                  },
                  child: const Text(
                    '%',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 159, 5),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("÷");
                  },
                  child: const Text(
                    '÷',
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("7");
                  },
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("8");
                  },
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("9");
                  },
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 159, 5),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("x");
                  },
                  child: const Text(
                    'x',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("4");
                  },
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("5");
                  },
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("6");
                  },
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 159, 5),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("-");
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("1");
                  },
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("2");
                  },
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("3");
                  },
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 159, 5),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("+");
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 63, vertical:20 ),
                    backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {
                    executeCalc("0");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 51, 51, 51),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc(".");
                  },
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 159, 5),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    executeCalc("=");
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
