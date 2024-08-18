import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/homepage.dart';
import 'package:flutter_firebase/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Web-specific Firebase initialization
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCLPymJ0zpCbabOE3PdrxOc0XaLvSOO1S4",
        appId: "1:943789572039:web:2c12f7924760da6d8c23e2",
        messagingSenderId: "943789572039",
        projectId: "fir-series-4e10f",
        authDomain: "fir-series-4e10f.firebaseapp.com", // Web-specific option
        storageBucket: "fir-series-4e10f.appspot.com", // Web-specific option
      ),
    );
  } else {
    // Default initialization for mobile (Android/iOS)
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashscreen(), // Use the correct class name for the splash screen
    );
  }
}
