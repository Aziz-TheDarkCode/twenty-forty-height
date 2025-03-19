import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';
import 'package:twenty_forty_eight/ui/widgets/board.dart';
import 'package:twenty_forty_eight/ui/widgets/header.dart';

void main() {
  runApp(
    DevicePreview(
      backgroundColor: Colors.white,
      enabled: true,
      defaultDevice: Devices.ios.iPhone13ProMax,
      isToolbarVisible: true,
      availableLocales: [Locale('en', 'US')],
      tools: const [
        DeviceSection(
          model: true,
          orientation: false,
          frameVisibility: false,
          virtualKeyboard: false,
        ),
      ],
      devices: [
        Devices.android.samsungGalaxyA50,
        Devices.android.samsungGalaxyNote20,
        Devices.android.samsungGalaxyS20,
        Devices.android.samsungGalaxyNote20Ultra,
        Devices.android.onePlus8Pro,
        Devices.android.sonyXperia1II,
        Devices.ios.iPhoneSE,
        Devices.ios.iPhone12,
        Devices.ios.iPhone12Mini,
        Devices.ios.iPhone12ProMax,
        Devices.ios.iPhone13,
        Devices.ios.iPhone13ProMax,
        Devices.ios.iPhone13Mini,
        Devices.ios.iPadPro11Inches
      ],
      builder: (context) => ChangeNotifierProvider(
        create: (context) => GameProvider(),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: Consumer<GameProvider>(
        builder: (_, gameboard, __) {
          return Scaffold(
            body: SafeArea(
                child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                children: [
                  Header(),
                  Text(gameboard.isGameOver() ? "Game Over" : ""),
                  Board()
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
