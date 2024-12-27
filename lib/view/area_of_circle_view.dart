import 'package:class_assignment_2/cubit/area_of_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircleAreaView extends StatelessWidget {
  const CircleAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CircleAreaCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Area of Circle")),
        body: BlocBuilder<CircleAreaCubit, double>(
          builder: (context, area) {
            final cubit = context.read<CircleAreaCubit>();
            final radiusController = TextEditingController();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: radiusController,
                    decoration: const InputDecoration(labelText: "Radius"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final radius = double.tryParse(radiusController.text) ?? 0.0;
                      cubit.calculateArea(radius);
                    },
                    child: const Text("Calculate"),
                  ),
                  const SizedBox(height: 20),
                  Text("Area: $area"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
