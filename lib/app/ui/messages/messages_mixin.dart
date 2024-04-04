import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model._type.color,
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final _MessageTypeEnum _type;

  MessageModel.error({required this.title, required this.message})
      : _type = _MessageTypeEnum.error;

  MessageModel.info({required this.title, required this.message})
      : _type = _MessageTypeEnum.info;
}

enum _MessageTypeEnum {
  error,
  info;

  Color get color {
    switch (this) {
      case _MessageTypeEnum.error:
        return Colors.red[600]!;
      case _MessageTypeEnum.info:
        return Colors.blue[200]!;
    }
  }
}
