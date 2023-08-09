import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/mapa_page.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/home',
        routes: {
          '/home': (_) => const HomePage(),
          '/mapa': (_) => const MapaPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            appBarTheme: const AppBarTheme(color: Colors.deepPurple),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepPurple),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
