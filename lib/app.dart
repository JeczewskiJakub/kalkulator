import 'package:flutter/material.dart';
import 'package:testnr1/screens/calculator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
   return const MaterialApp(
     home: Calculator(),
   );
 }
}