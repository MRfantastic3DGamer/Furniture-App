import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/HomePage.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
      ),
      home: const HomePage(),
    );
  }
}
