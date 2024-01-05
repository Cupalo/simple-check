import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      //   useMaterial3: true,
      // ),
      // themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}
