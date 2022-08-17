import 'package:consumo_api/models/todo_provider.dart';
import 'package:consumo_api/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.grey,
        ),
        title: 'Consumo API',
        home: const HomeScreen(),
      ),
    );
  }
}
