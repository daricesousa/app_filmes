import 'dart:developer';

import 'package:app_filmes/app/services/login/login_service.dart';
import 'package:app_filmes/app/ui/loader/loader_mixin.dart';
import 'package:app_filmes/app/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final LoginService _loginService;

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  void login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
          title: "Sucesso", message: "Login realizado com sucesso"));
    } catch (e, s) {
      loading(false);
      log("Erro ao realizar login", error: e, stackTrace: s);
      message(MessageModel.error(
          title: "Login error", message: "Erro ao realizar login"));
    }
  }
}
