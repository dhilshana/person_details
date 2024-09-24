import 'package:flutter/material.dart';
import 'package:sqf_lite/screens/home.dart';
import 'package:sqf_lite/services/local_database.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
await LocalDatabase().initializeDb();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
