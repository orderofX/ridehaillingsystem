import 'package:ride_uber/core/user/domain/entities/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  UserModel(
      {@required String fullName,
      @required String email,
      @required String phoneNumber})
      : super(email: email, phoneNumber: phoneNumber, fullName: fullName);

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    print('MODEL JSON OR NOT: ${json['fullname']}');
    return UserModel(
        fullName: json['fullname'],
        email: json['email'],
        phoneNumber: json['phoneNumber']);
  }
}
