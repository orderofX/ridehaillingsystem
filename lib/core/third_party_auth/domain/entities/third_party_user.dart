import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThirdPartyUser extends Equatable {
  final String email;
  final String phoneNumber;
  final String fullName;

  ThirdPartyUser(
      {@required this.email,
      @required this.phoneNumber,
      @required this.fullName});

  @override
  // TODO: implement props
  List<Object> get props => [email, phoneNumber, fullName];
}
