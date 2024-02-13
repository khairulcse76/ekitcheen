import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SingleRecipeView extends StatefulWidget {
  final String Url;
  SingleRecipeView(this.Url, {super.key});

  @override
  State<SingleRecipeView> createState() => _SingleRecipeViewState();
}

class _SingleRecipeViewState extends State<SingleRecipeView> {

  late final String finalurl;
   WebViewController controller = WebViewController();

   bool Loadingbar=true;

   @override
  void initState() {
    super.initState();
    if(widget.Url.toString().contains('http://')){
      finalurl = widget.Url.toString().replaceAll('http://',  'https://');
    }else{
      finalurl = widget.Url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        centerTitle: true,
      ),
      body: WebViewWidget(
          controller: controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0xFFc1dfc4))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                 /*showDialog(context: context,
                     barrierDismissible: false,
                     builder: (BuildContext context){
                   return AlertDialog(
                     content: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text('Progress: $progress%'),
                         SizedBox(height: 10),
                         LinearProgressIndicator(value: progress / 100),
                       ],
                     ),
                   );
                 });*/
                },
                onPageStarted: (String url) {
                  //Navigator.pop(context);
                },
                onPageFinished: (String url) {
                  //Navigator.pop(context);
                  //controller.loadRequest(Uri.parse(finalurl).toString() as Uri);
                },
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith(finalurl)) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(finalurl)),
      ),
    );
  }
}
