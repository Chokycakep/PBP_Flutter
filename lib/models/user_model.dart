class UserModel {
  String name;
  String _email;
  String _password;

  UserModel({
    required String name,
    required String email,
    required String password,
  })  : name = name,
        _email = email,
        _password = password;

  String get email => _email;
  set email(String value) => _email = value;

  String get password => _password;
  set password(String value) => _password = value;

  // Simulasi database sederhana
  static UserModel? registeredUser;
}
