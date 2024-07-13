import 'package:app_filmes/app/repositories/login/login_repository.dart';
import 'package:app_filmes/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepositoryImp implements LoginRepository {
  @override
  Future<UserCredential> login() async {
    final googleUser = await GoogleSignIn(
            clientId: DefaultFirebaseOptions.android.androidClientId)
        .signIn();
    print(googleUser);
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return throw Exception('Erro ao fazer login com Google');
  }
}
