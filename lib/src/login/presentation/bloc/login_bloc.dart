
import 'package:ride_uber/src/login/domain/usecases/login.dart';
import 'package:meta/meta.dart';

class LoginBloc {
  final Login login;

  LoginBloc({@required this.login});

  void userLogin(emailIn, passwordIn) async {
    final failureOrUser =
        await login(LoginParams(email: emailIn, password: passwordIn));

    failureOrUser.fold((l) => print(l), (r) => print('SUCCESS: $r'));
  }
}
