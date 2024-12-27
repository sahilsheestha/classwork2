import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<double> {
  CalculatorCubit() : super(0.0);

  void calculate(String operation, double num1, double num2) {
    switch (operation) {
      case '+':
        emit(num1 + num2);
        break;
      case '-':
        emit(num1 - num2);
        break;
      case '*':
        emit(num1 * num2);
        break;
      case '/':
        if (num2 != 0) {
          emit(num1 / num2);
        } else {
          emit(double.nan); // Handle division by zero
        }
        break;
      default:
        emit(0.0);
    }
  }
}
