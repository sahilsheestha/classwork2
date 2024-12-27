import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/calculator_cubit.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: BlocBuilder<CalculatorCubit, double>(
          builder: (context, result) {
            final cubit = context.read<CalculatorCubit>();
            final num1Controller = TextEditingController();
            final num2Controller = TextEditingController();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: num1Controller,
                    decoration: const InputDecoration(labelText: "Number 1"),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: num2Controller,
                    decoration: const InputDecoration(labelText: "Number 2"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(num1Controller.text) ?? 0.0;
                          final num2 = double.tryParse(num2Controller.text) ?? 0.0;
                          cubit.calculate('+', num1, num2);
                        },
                        child: const Text("+"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(num1Controller.text) ?? 0.0;
                          final num2 = double.tryParse(num2Controller.text) ?? 0.0;
                          cubit.calculate('-', num1, num2);
                        },
                        child: const Text("-"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(num1Controller.text) ?? 0.0;
                          final num2 = double.tryParse(num2Controller.text) ?? 0.0;
                          cubit.calculate('*', num1, num2);
                        },
                        child: const Text("*"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(num1Controller.text) ?? 0.0;
                          final num2 = double.tryParse(num2Controller.text) ?? 0.0;
                          cubit.calculate('/', num1, num2);
                        },
                        child: const Text("/"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Result: $result"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
