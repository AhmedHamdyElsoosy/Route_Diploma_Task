// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCEN82gR-PrVpbFPF5xTYLUtbkDZl7iThI',
    appId: '1:456968032713:web:a53c1f4a27924444fd9818',
    messagingSenderId: '456968032713',
    projectId: 'firebaseflutter-407213',
    authDomain: 'fir-flutter-407213.firebaseapp.com',
    storageBucket: 'firebaseflutter-407213.appspot.com',
    measurementId: 'G-K3BH41PQBY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApjiKEJDWs1J5B_9rdr1wYtJkBwcZz-WY',
    appId: '1:456968032713:android:3c4e9d2dded6e297fd9818',
    messagingSenderId: '456968032713',
    projectId: 'firebaseflutter-407213',
    storageBucket: 'firebaseflutter-407213.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqbhWnViS1qc7NlLhPKlaQnVKjJ3Ze3Wc',
    appId: '1:456968032713:ios:4d13fdf4618d931cfd9818',
    messagingSenderId: '456968032713',
    projectId: 'firebaseflutter-407213',
    storageBucket: 'firebaseflutter-407213.appspot.com',
    iosBundleId: 'com.example.routeDiplomaTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqbhWnViS1qc7NlLhPKlaQnVKjJ3Ze3Wc',
    appId: '1:456968032713:ios:a84ee27d94e4d843fd9818',
    messagingSenderId: '456968032713',
    projectId: 'firebaseflutter-407213',
    storageBucket: 'firebaseflutter-407213.appspot.com',
    iosBundleId: 'com.example.routeDiplomaTask.RunnerTests',
  );
}
