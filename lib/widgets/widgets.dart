import 'package:flutter/services.dart';

void unFocusAndCallBack(VoidCallback callback) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  callback();
}
