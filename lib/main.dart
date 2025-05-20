import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/auth/views/splash_screen.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(const BiometriaApp());
}

class BiometriaApp extends StatelessWidget {
  const BiometriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Biometría App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(), 
      ),
    );
  }
}
