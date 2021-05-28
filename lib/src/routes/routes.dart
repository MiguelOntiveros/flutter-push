import 'package:flutter/material.dart';
import 'package:pushmo/src/pages/home.dart';
import 'package:pushmo/src/pages/messages.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'message': (BuildContext context) => MessagesPage(),
  };
}
