// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCLPymJ0zpCbabOE3PdrxOc0XaLvSOO1S4',
    appId: '1:943789572039:web:2c12f7924760da6d8c23e2',
    messagingSenderId: '943789572039',
    projectId: 'fir-series-4e10f',
    authDomain: 'fir-series-4e10f.firebaseapp.com',
    storageBucket: 'fir-series-4e10f.appspot.com',
    measurementId: 'G-J0HQ9BXZNY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4WTwE3vjI1lpbrbukj-5aS03jOk3hbnY',
    appId: '1:943789572039:android:75706f6e31553aae8c23e2',
    messagingSenderId: '943789572039',
    projectId: 'fir-series-4e10f',
    storageBucket: 'fir-series-4e10f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLes-hvZ9ObZAeqvIlXxAcCboix6BZN6E',
    appId: '1:943789572039:ios:261546f5b283d9d68c23e2',
    messagingSenderId: '943789572039',
    projectId: 'fir-series-4e10f',
    storageBucket: 'fir-series-4e10f.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLes-hvZ9ObZAeqvIlXxAcCboix6BZN6E',
    appId: '1:943789572039:ios:261546f5b283d9d68c23e2',
    messagingSenderId: '943789572039',
    projectId: 'fir-series-4e10f',
    storageBucket: 'fir-series-4e10f.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLPymJ0zpCbabOE3PdrxOc0XaLvSOO1S4',
    appId: '1:943789572039:web:52cf61c3b6e1e3238c23e2',
    messagingSenderId: '943789572039',
    projectId: 'fir-series-4e10f',
    authDomain: 'fir-series-4e10f.firebaseapp.com',
    storageBucket: 'fir-series-4e10f.appspot.com',
    measurementId: 'G-N2L9YR1D4Y',
  );
}
