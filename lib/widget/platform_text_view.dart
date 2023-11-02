import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'auto_platform_view.dart';

class PlatformTextView extends StatelessWidget {
  final String text;


  const PlatformTextView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoPlatformView(
      viewType: 'com.example.myapp/text_view',
      creationParams: text,
    );
  }
}