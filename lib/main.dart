// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/events_feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const EventsFeedScreen(),
    );
  }
}
