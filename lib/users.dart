import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier{
  final List<Map<String,String?>> _users = [
    {
      "email" : "yazanradaideh123@gmail.com",
      "password" : "yazanradaideh123"
    },
    {
      "email" : "mohammed123@gmail.com",
      "password" : "mohammed123"
    },
    {
      "email" : "abedalraheem@gmail.com",
      "password" : "abedalraheem"
    },

  ];
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void addNewUser(String email,String password){
    _users.add({
      "email" : email,
      "password" : password
    });
    _isAuth = true;
    notifyListeners();
  }

  void tryToLogin(Map<String,String?> user){
    int index = -1;
    for(int i = 0;i<_users.length;i++){
      if(user['email'] == _users[i]['email'] && user['password'] == _users[i]['password']){
        index = i;
        break;
      }
    }
    if(index > -1){
      _isAuth = true;
      notifyListeners();
    }else{
      throw "Err";
    }
  }

  void logout(){
    _isAuth = false;
    notifyListeners();
  }
}