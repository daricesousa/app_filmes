import 'package:app_filmes/app/ui/loader/loader_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin {
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  void login() async {
    loading(true);
    await 2.seconds.delay();
    loading(false);
  }
}
