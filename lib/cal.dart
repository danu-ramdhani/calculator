import 'package:calculator/button_number.dart';
import 'package:calculator/button_operation.dart';
import 'package:flutter/material.dart';

class Cal extends StatefulWidget {
  const Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  String output1 = '';
  String output2 = '';
  String operation = '';
  String hasil = '';

  void _showOutput(String val) {
    setState(() {
      if (operation == '') {
        output1 += val;
      }

      if (operation != '') {
        output2 += val;
      }
    });
  }

  void _equal() {
    try {
      double first = double.parse(output1);
      double second = double.parse(output2);
      setState(() {
        if (operation == '+') {
          hasil = (first + second).toString();
        }
        if (operation == '-') {
          hasil = (first - second).toString();
        }
        if (operation == 'x') {
          hasil = (first * second).toString();
        }
        if (operation == '/') {
          hasil = (first / second).toString();
        }
        if (operation == '%') {
          hasil = (first / 100 * second).toString();
        }

        output1 = '';
        output2 = '';
        operation = '';
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong expresion'),
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                textAlign: TextAlign.right,
                readOnly: true,
                controller:
                    TextEditingController(text: output1 + operation + output2),
                style: const TextStyle(fontSize: 32),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: '= $hasil'),
                style: const TextStyle(fontSize: 48),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      fixedSize: const Size(152, 72),
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'AC',
                      style: TextStyle(fontSize: 32),
                    ),
                    onPressed: () {
                      setState(() {
                        output1 = '';
                        output2 = '';
                        operation = '';
                      });
                    },
                  ),
                  ButtonNumber(
                    value: '%',
                    onpress: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                  ),
                  ButtonOperation(
                    value: '/',
                    onpress: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonNumber(
                    value: '7',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '8',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '9',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonOperation(
                    value: 'x',
                    onpress: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonNumber(
                    value: '4',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '5',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '6',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonOperation(
                    value: '-',
                    onpress: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonNumber(
                    value: '1',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '2',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '3',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonOperation(
                    value: '+',
                    onpress: (value) {
                      setState(() {
                        operation = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonNumber(
                    value: '0',
                    onpress: (value) {
                      _showOutput(value);
                    },
                  ),
                  ButtonNumber(
                    value: '.',
                    onpress: (value) {
                      setState(() {
                        _showOutput(value);
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      fixedSize: const Size(152, 72),
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _equal,
                    child: const Text(
                      '=',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
