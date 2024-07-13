import 'package:app_filmes/app/repositories/login/login_repository.dart';
import 'package:app_filmes/app/services/login/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginServiceImp implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImp({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();
}
