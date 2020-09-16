class UserDataModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserDataModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      avatar: map['avatar'],
    );
  }
}
