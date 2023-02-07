import 'package:flutter/material.dart';
import 'package:list_students/StudentsNotifier.dart';
import 'package:list_students/lista.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  print(dotenv.get("API_HOST", fallback: ""));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentsNotifier(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Lista()
      )
    );
  }
}
