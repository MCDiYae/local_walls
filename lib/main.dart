import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'screens/home_page.dart';
import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';
import 'utils/search_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WallpaperProviderSearch(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WallpaperProviderSearch>().loadWallpapers();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sunset Wallpaper",
      theme: buildAppTheme(),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) =>
            const TermsOfUseScreen(), // Set Terms of Use as the initial screen
        '/home': (context) =>
            const MyHomePage(), // Add a route for the home page
      },
    );
  }
}
