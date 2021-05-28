import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de Push'),
      ),
      body: Center(
        child: Text(
          args.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
