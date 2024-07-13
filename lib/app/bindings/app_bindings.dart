import 'package:app_filmes/app/repositories/login/login_repository.dart';
import 'package:app_filmes/app/repositories/login/login_repository_imp.dart';
import 'package:app_filmes/app/services/login/login_service.dart';
import 'package:app_filmes/app/services/login/login_service_imp.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImp(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImp(loginRepository: Get.find()),
        fenix: true);
  }
}
