import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/screens/home.dart';
import 'package:sqf_lite/services/local_database.dart';
import 'package:sqf_lite/services/provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
await LocalDatabase().initializeDb();
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: const MainApp()));
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
