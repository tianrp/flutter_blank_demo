import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AutoPlatformView extends StatelessWidget {
  final String viewType;
  final dynamic creationParams;

  const AutoPlatformView(
      {super.key, required this.viewType, required this.creationParams});

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      return AndroidView(
        viewType: viewType,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    if(Platform.isIOS) {
      return UiKitView(
        viewType: viewType,
        creationParams: {'text': creationParams},
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return const Text("nonsupport");
  }
}
