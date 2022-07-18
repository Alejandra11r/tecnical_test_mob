import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_mob/providers/cats_provider.dart';
import 'package:tecnical_test_mob/screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CatsProvider(), lazy: false)
    ], child: const MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     
      initialRoute: 'home',
      routes: {
        'home' : (_) => const HomeScreen(),
        'detail': (_) => const  DetailScreen()
      },
      theme: ThemeData(
        fontFamily: 'EduNSW',
      )
    );
  }
}