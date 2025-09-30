import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition_app/controller/home_provider.dart';
import 'package:text_recognition_app/ui/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HomeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Recognition App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFF636117)),
        useMaterial3: true,
        fontFamily: 'sora',
      ),
      home: const HomePage(),
    );
  }
}
