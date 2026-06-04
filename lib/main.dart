import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spendday_app/provider/spend_provider.dart';
import 'package:spendday_app/features/spend_summaryScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SpendProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Summary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2ECC8A),
          surface: Color(0xFF152232),
        ),
        fontFamily: 'SF Pro Display',
      ),
      home: const SpendSummaryScreen(),
    );
  }
}
