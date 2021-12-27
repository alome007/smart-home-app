import 'package:flutter/material.dart';
import 'package:iot_app/screens/rooms_screen.dart';

void main() {
  runApp(const IotApp());
}

class IotApp extends StatelessWidget {
  const IotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoomsScreen();
  }
}
