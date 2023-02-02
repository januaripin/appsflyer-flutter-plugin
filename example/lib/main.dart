import 'dart:async';
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import './main_page.dart';

Future<void> main() async {
  await DotEnv().load('.env');

  if (kIsWeb) {
    //To expone the dart variable to global js code
    js.context['web_app_id'] = DotEnv().env["WEB_APP_ID"];
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MainPage(),
    );
  }
}
