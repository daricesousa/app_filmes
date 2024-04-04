import 'package:app_filmes/app/ui/loader/loader_mixin.dart';
import 'package:app_filmes/app/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  void login() async {
    loading(true);
    message(null);
    await 2.seconds.delay();
    loading(false);
    message(MessageModel.info(title: "Title", message: "Message"));
  }
}
