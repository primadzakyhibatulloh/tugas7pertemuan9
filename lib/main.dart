import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h1d023040_tugas7/services/auth_service.dart';
import 'package:h1d023040_tugas7/screens/check_auth_screen.dart';
import 'package:h1d023040_tugas7/screens/login_screen.dart';
import 'package:h1d023040_tugas7/screens/dashboard_screen.dart';
import 'package:h1d023040_tugas7/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData kDarkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigo[300],
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          backgroundColor: Colors.indigo[400],
          foregroundColor: Colors.white,
        ),
      ),
      
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFF1E1E1E),
      ),
    );

    return ChangeNotifierProvider(
      create: (ctx) => AuthService(),
      child: MaterialApp(
        title: 'Prima Motor Rental (Pro)',
        
        theme: kDarkTheme,
        darkTheme: kDarkTheme,
        themeMode: ThemeMode.dark,
        
        home: const AuthCheckScreen(),
        
        routes: {
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          DashboardScreen.routeName: (ctx) => const DashboardScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
        },
      ),
    );
  }
}