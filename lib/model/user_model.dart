class UserModel {
  final String id;
  final String name;
  final String chooseType;
  final String user;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.chooseType,
    required this.user,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      chooseType: json['ChooseType'],
      name: json['Name'],
      user: json['User'],
      password: json['Password'],
    );
  }

  Map<String, dynamic> toJson(map) {
    return {
      'id': id,
      'ChooseType': chooseType,
      'Name': name,
      'User': user,
      'Password': password,
    };
  }
}
