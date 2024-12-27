import 'package:flutter/material.dart';
import '../cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = DashboardCubit();
    return Scaffold(
      appBar: AppBar(title: const Text("Sahil's class_assignment_2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => cubit.openSimpleInterestView(context),
              child: const Text("Simple Interest"),
            ),
            ElevatedButton(
              onPressed: () => cubit.openCircleAreaView(context),
              child: const Text("Area of Circle"),
            ),
            ElevatedButton(
              onPressed: () => cubit.openCalculatorView(context),
              child: const Text("Calculator"),
            ),
          ],
        ),
      ),
    );
  }
}
