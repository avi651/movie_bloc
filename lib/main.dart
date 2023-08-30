import 'package:flutter/material.dart';
import 'package:movie_db/core/services/service_locator.dart';

import 'presentation/main_page.dart';

void main() async {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
