import 'package:donateplasma/models/User.dart';
import 'package:flutter/cupertino.dart';

class Users extends ChangeNotifier {
  List<User> _users = [
    User(
        userId: 1,
        userName: 'Santosh',
        userDP: 'assets/images/user0.png',
        userPhone: '+880123456789',
        userLocation: 'Dhaka',
        userBlood: 'B+'),
    User(
        userId: 2,
        userName: 'Vignesh',
        userDP: 'assets/images/user0.png',
        userPhone: '+880123456789',
        userLocation: 'Khulna',
        userBlood: 'O+'),
  ];

  List<User> get userList {
    final baseUserList = [..._users];
    return baseUserList;
  }
}
