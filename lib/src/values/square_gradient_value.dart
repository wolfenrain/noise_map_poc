import 'dart:math';

import 'package:habitat/habitat.dart';
import 'package:vector_math/vector_math_64.dart';

/// {@template square_gradient_value}
/// A [Value] class that returns a value based on a square gradient.
/// {@endtemplate}
class SquareGradientValue extends Value {
  /// {@macro square_gradient_value}
  const SquareGradientValue({
    required Vector2 size,
    double density = 0,
  })  : _size = size,
        _density = density;

  final Vector2 _size;

  final double _density;

  @override
  double get(int x, int y) {
    final wrappedX = x % _size.x;
    final wrappedY = y % _size.y;

    final xValue = (wrappedX * 2 - _size.x).abs() / _size.x;
    final yValue = (wrappedY * 2 - _size.y).abs() / _size.y;
    return (1 - max(xValue, yValue)) - _density;
  }
}
