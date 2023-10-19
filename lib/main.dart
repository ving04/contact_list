import 'package:flutter/material.dart';
import 'package:contact_list/pages/contact_list.dart';

void main() {
  runApp(const PhonebookApp());
}

class PhonebookApp extends StatelessWidget {
  const PhonebookApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_Agenda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const ContactList(),
    );
  }
}
