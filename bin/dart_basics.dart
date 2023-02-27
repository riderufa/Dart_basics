import 'dart:math';

import 'package:dart_basics/dart_basics.dart' as dart_basics;
import 'package:test/test.dart';

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

class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.vector() {
    return Point(1, 1, 1);
  }

  double distanceTo(Point other) {
    return sqrt(
        pow((x - other.x), 2) + pow((y - other.y), 2) + pow((z - other.z), 2));
  }
}

double triangleArea(Point p1, Point p2, Point p3) {
  double result = (p2.x - p1.x) * (p3.y - p1.y) - (p3.x - p1.x) * (p2.y - p1.y);
  if (result < 0) {
    result *= -1;
  }
  return result / 2;
}

extension on num {
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

class User {
  final String email;

  User(this.email);
}

class AdminUser extends User with MailSystem {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin MailSystem on User {
  String getMailSystem() {
    return email.split('@').last;
  }
}

class UserManager<T extends User> {
  final List<T> users;

  UserManager() : users = [];

  void addUser(T data) {
    users.add(data);
  }

  void deleteUser(T data) {
    users.remove(data);
  }

  void getEmails() {
    for (var user in users) {
      if (user is AdminUser) {
        print(user.getMailSystem());
      } else {
        print(user.email);
      }
    }
  }
}

void main(List<String> arguments) {
  final t = DelimetersCalculator(12, 30);
  print(t.gcd());
  print(t.lcm());
  print(t.multipliers(45));
  print(t.decimalToBinary(25));
  print(t.binaryToDecimal('10010'));
  print(t.parseString('asda sdfgdf 23 one hfh 65'));
  print(t.parseList(['asd', 'sdf', 'dfg', 'asd']));

  var a = ['one, two, three, cat, dog', 'one, two, zero, zero'];
  for (var s in a) {
    print(t.parseStringNew(s));
  }

  var p1 = Point(3, 4, 5);
  var p2 = Point(7, -2, 6);
  print(p1.distanceTo(p2));

  final pZero = Point.zero();
  print(pZero);
  print(pZero.x);

  p1 = Point(1, 1, 0);
  p2 = Point(-2, 4, 0);
  var p3 = Point(-2, -2, 0);
  print(triangleArea(p1, p2, p3));

  final u = AdminUser('3434455@mail.ru');
  print(u.getMailSystem());

  num b = 999;
  print(b.numberRoot(3, 0.1));

  final u1 = User("3434455@mail.ru");
  final u2 = User("3434456@mail.ru");
  final u3 = AdminUser("3434457@mail.ru");
  var um = UserManager();
  um.addUser(u1);
  um.addUser(u2);
  print(um.users);
  um.deleteUser(u2);
  print(um.users);
  um.addUser(u3);
  um.getEmails();
}
