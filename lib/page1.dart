import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'widget/platform_text_view.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool showPlatformView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showPlatformView)
          const SizedBox(
          width: 300,
          height: 70,
          child: PlatformTextView(
          text: "PlatformView",
      )),
            SizedBox(height: 20,),

            TextButton(onPressed: () {
              setState(() {
                showPlatformView = !showPlatformView;
              });
            }, child: Text(showPlatformView ? "Remove PlatformView" : "Add PlatformView", style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.blue,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(
              onPressed: () {
                platform.invokeMethod(KEY_OPEN_PAGE, "page2");
              },
              child: const Text(
                "Next Page",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.blue,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // SizedBox(height: 20,),
            // TextButton(onPressed: () {
            //   platform.invokeMethod(KEY_OPEN_PAGE,"page3");
            // }, child: const Text("跳转no platform view page", style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w500),))
          ],
        ),
      ),
    );
  }
}
