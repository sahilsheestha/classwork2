import 'package:class_assignment_2/view/area_of_circle_view.dart';
import 'package:class_assignment_2/view/simple_interest_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../view/calculator_view.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit() : super(null);

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleInterestView(),
        ));
  }

  void openCircleAreaView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CircleAreaView(),
        ));
  }

  void openCalculatorView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CalculatorView(),
        ));
  }
}
