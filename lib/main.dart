import 'package:flutter/cupertino.dart'; //Adding more widget option for the "÷" symbol
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Manage the result section for the sum
  double result = 0.0;

  // TextEditingController for each input field to get the value
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  // Perform calculations based on the operation
  void calculate(String operation) {
    double num1 = double.tryParse(firstController.text) ?? 0.0;
    double num2 = double.tryParse(secondController.text) ?? 0.0;

    setState(() {
      if (operation == '+') {
        result = num1 + num2;
      } else if (operation == '-') {
        result = num1 - num2;
      } else if (operation == '*') {
        result = num1 * num2;
      } else if (operation == '/') {
        result = num2 != 0 ? num1 / num2 : 0; // Avoiding the division by zero
      }
    });
  }

  // Clear button input fields and result
  void clearInputs() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Addition Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(" + "),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () => calculate('+'),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 5),
                Text(' = $result'),
              ],
            ),

            const SizedBox(height: 20),

            // Subtraction Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(" - "),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () => calculate('-'),
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 5),
                Text(' = $result'),
              ],
            ),

            const SizedBox(height: 20),

            // Multiplication Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(" * "),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () => calculate('*'),
                  icon: const Icon(Icons.close),
                ),
                const SizedBox(width: 5),
                Text(' = $result'),
              ],
            ),

            const SizedBox(height: 20),

            // Division Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(" / "),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () => calculate('/'),
                  icon: const Icon(CupertinoIcons.divide_circle),
                ),
                const SizedBox(width: 5),
                Text(' = $result'),
              ],
            ),

            const SizedBox(height: 40),

            // Clear Button
            ElevatedButton(
              onPressed: clearInputs,
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }
}
