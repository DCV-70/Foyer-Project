import 'package:flutter/material.dart';

import 'package:foyer_project/main_screen.dart';
import 'package:foyer_project/profile_bloc.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foyer Project',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
