import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String email;
  final String phoneNumber;
  final String fullName;

  User(
      {@required this.email,
      @required this.phoneNumber,
      @required this.fullName});

  @override
  List<Object> get props => [email, phoneNumber, fullName];
}
