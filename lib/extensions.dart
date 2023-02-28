import 'dart:math';

extension RootNumExtension on num {
  num numberRoot(int n, double eps) {
    num calcIter(num a) {
      return ((n - 1) * a + this / pow(a, (n - 1))) / n;
    }
    var x = this;
    var xNext = calcIter(x);
    num temp;
    while ((xNext - x).abs() > eps) {
      temp = xNext;
      xNext = calcIter(xNext);
      x = temp;
    }
    return xNext;
  }
}
