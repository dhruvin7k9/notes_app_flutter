import 'package:flutter/material.dart';
import 'package:note_app/screens/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // initialize hive
  await Hive.initFlutter();

  // open a hive box
  await Hive.openBox("note_database");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
    );
  }
}
