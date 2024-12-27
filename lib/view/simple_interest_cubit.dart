import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/simple_interest_cubit.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleInterestCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Simple Interest")),
        body: BlocBuilder<SimpleInterestCubit, double>(
          builder: (context, interest) {
            final cubit = context.read<SimpleInterestCubit>();
            final principalController = TextEditingController();
            final rateController = TextEditingController();
            final timeController = TextEditingController();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: principalController,
                    decoration: const InputDecoration(labelText: "Principal"),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: rateController,
                    decoration: const InputDecoration(labelText: "Rate"),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: timeController,
                    decoration: const InputDecoration(labelText: "Time"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final principal = double.tryParse(principalController.text) ?? 0.0;
                      final rate = double.tryParse(rateController.text) ?? 0.0;
                      final time = double.tryParse(timeController.text) ?? 0.0;
                      cubit.calculateSimpleInterest(principal, rate, time);
                    },
                    child: const Text("Calculate"),
                  ),
                  const SizedBox(height: 20),
                  Text("Simple Interest: $interest"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
