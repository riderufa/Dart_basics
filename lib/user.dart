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
