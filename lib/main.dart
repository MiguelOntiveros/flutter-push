import 'package:flutter/material.dart';
import 'package:pushmo/src/services/push_notification.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}
