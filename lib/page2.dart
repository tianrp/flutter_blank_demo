import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/platform_text_view.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "page2",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20,),
            const SizedBox(
                width: 200,
                height: 100,
                child: PlatformTextView(
                  text: "PlatformView",
                )),
          ],
        ),
      ),
    );
  }
}
