import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  // TODO: implement props
  String toString() => "Error occured";
}

class ServerFailure extends Failure {
  @override
  String toString() => "Failed verification";

  @override
  List<Object> get props => null;
}

class InternetFailure extends Failure {
  @override
  String toString() => "No internet connection";

  @override
  List<Object> get props => null;
}
