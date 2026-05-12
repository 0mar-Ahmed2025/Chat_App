import 'package:chat_app/core/utils/app_constantc.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.loginView: (context) => LoginView(),
        AppRoutes.registerView: (context) => RegisterView(),
        AppRoutes.homeView: (context) => HomeView(),
      },
      initialRoute: AppRoutes.loginView,
    );
  }
}
