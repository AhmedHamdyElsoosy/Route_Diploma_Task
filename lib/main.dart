import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:route_diploma_task/screens/home_screen.dart';
import 'package:route_diploma_task/screens/login_screen.dart';
import 'package:route_diploma_task/screens/signUp_screen.dart';
import 'package:route_diploma_task/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';


Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool("is_dark")?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();

  runApp(MyApp(isDark:isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeSettings(isDark),
      builder: (context, snapshot) {
        final settings = Provider.of<ThemeSettings>(context);
        return MaterialApp(
          debugShowCheckedModeBanner:  false,
          title: 'Route Diploma Task',
          theme: settings.currentTheme,
          // darkTheme: settings.currentTheme,
          // themeMode: provider.theme,
          home: const LoginScreen(),
          routes: {
            "login_screen" : (context) => const LoginScreen(),
            "home_screen" : (context) => const HomeScreen(),
            "signUp_screen" : (context) => const SignUpScreen(),
          },
        );
      }
    );
  }
}
