import 'package:flutter/material.dart';
import 'pages/sector_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const TrendPilotApp());
}

class TrendPilotApp extends StatelessWidget {
  const TrendPilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TrendPilot",
      theme: AppTheme.darkTheme,
      home: const SectorPage(),
    );
  }
}