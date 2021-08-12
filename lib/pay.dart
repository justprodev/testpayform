import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPageView extends StatefulWidget {
  const PayPageView(
      {Key? key})
      : super(key: key);

  @override
  _PayPageViewState createState() => _PayPageViewState();
}

class _PayPageViewState extends State<PayPageView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  
  Future<void> loadInitialUrl(WebViewController controller) async {
    await controller.loadUrl('https://justprodev.com/partners/silk/1.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          loadInitialUrl(webViewController);
        },
      ),
    );
  }
}
