import 'package:dart_basics/calculator.dart';
import 'package:dart_basics/extensions.dart';
import 'package:dart_basics/point.dart';
import 'package:dart_basics/user.dart';

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
