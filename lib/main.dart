import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';

import './widgets/bank_card.dart';
//import './widgets/nav_tile.dart';
//import './modals/send_payment.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Color(0x00000000)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
        ),
        themeMode: ThemeMode.light,
        home: HomeScreen(),
      );
    });
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FairTrade"),
      ),
      body: Column(
        children: [
          BankCard(1200, 123456),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          Row(
            children: const [],
          )
        ],
      ),
    );
  }
}
