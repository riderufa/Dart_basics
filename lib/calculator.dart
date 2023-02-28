class DelimetersCalculator {
  final int x;
  final int y;

  DelimetersCalculator(this.x, this.y);

  int gcd() {
    int a;
    int b;
    int temp;
    if (x < y) {
      a = y;
      b = x;
    } else {
      a = x;
      b = y;
    }
    while (b != 0) {
      a %= b;
      temp = a;
      a = b;
      b = temp;
    }
    return a;
  }

  int lcm() {
    return x * y ~/ gcd();
  }

  List multipliers(int a) {
    int b = a ~/ 2;
    var c = [];
    for (int i = 2; i <= b; i++) {
      while (a % i == 0) {
        c.add(i);
        a ~/= i;
      }
      if (a == 1) {
        break;
      }
    }
    return c;
  }

  String decimalToBinary(int a) {
    String s = '';
    while (a != 0) {
      s = (a % 2).toString() + s;
      a ~/= 2;
    }
    return s;
  }

  int binaryToDecimal(String a) {
    Iterable<String> b = a.split('').reversed;
    int multiplier = 1;
    int result = 0;
    for (var s in b) {
      final symbol = int.tryParse(s);
      if (symbol == 1 || symbol == 0) {
        result += (symbol! * multiplier);
        multiplier *= 2;
      } else {
        throw ArgumentError('Not binary code');
      }
    }
    ;
    return result;
  }

  List parseString(String a) {
    var b = [];
    for (var s in a.split(' ')) {
      final n = int.tryParse(s);
      if (n != null) {
        b.add(n);
      }
    }
    return b;
  }

  Map parseList(List a) {
    var b = {};
    for (var s in a) {
      if (b[s] == null) {
        b[s] = 1;
      } else {
        b[s] += 1;
      }
    }
    return b;
  }

  Set parseStringNew(String a) {
    Set b = {};
    for (var s in a.split(', ')) {
      if (s == 'one') {
        b.add(1);
      } else if (s == 'two') {
        b.add(2);
      } else if (s == 'three') {
        b.add(3);
      } else if (s == 'four') {
        b.add(4);
      } else if (s == 'five') {
        b.add(5);
      } else if (s == 'six') {
        b.add(6);
      } else if (s == 'seven') {
        b.add(7);
      } else if (s == 'eight') {
        b.add(8);
      } else if (s == 'nine') {
        b.add(9);
      } else if (s == 'zero') {
        b.add(0);
      }
    }
    return b;
  }
}
