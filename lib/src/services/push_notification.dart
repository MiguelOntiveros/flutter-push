//SHA1: D5:02:62:5F:8B:35:A7:47:DE:AC:45:84:82:71:FD:04:8F:A7:C0:F0
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print(' onBackground Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.title ?? 'Sin Título');
    _messageStream.add(message.notification?.body ?? 'Sin Body');
    _messageStream.add(message.data[''] ?? 'no data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.title ?? 'Sin Título');
    _messageStream.add(message.notification?.body ?? 'Sin Body');
    _messageStream.add(message.data[''] ?? 'no data');
  }

  static Future _onOpenMessageOpenApp(RemoteMessage message) async {
    //print('onOpenMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.title ?? 'Sin Título');
    _messageStream.add(message.notification?.body ?? 'Sin Body');
    _messageStream.add(message.data[''] ?? 'no data');
  }

  static Future initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
    //Local Notifications
  }

//se creo este metodo para cerrar el Stream, aunque nunca se debe cerrar porque
// siempre se tiene que estar pendiente de las notificaciones
  static closeStreams() {
    _messageStream.close();
  }
}
