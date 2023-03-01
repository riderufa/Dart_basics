extension RootNumExtension on num {
  num numberRoot(int n, double eps) {
    num calcIter(num a) {
      var b = a;
      for (var i = 1; i < n - 1; i++) {
        b *= a;
      }
      return ((n - 1) * a + this / b) / n;
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
