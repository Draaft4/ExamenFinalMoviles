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
    apiKey: 'AIzaSyD5tmY8cM20vvRT2A9ew9lib4VNq6tY3gs',
    appId: '1:522444964866:web:59fa0614920a44526d931b',
    messagingSenderId: '522444964866',
    projectId: 'examen-final-flutterfire',
    authDomain: 'examen-final-flutterfire.firebaseapp.com',
    storageBucket: 'examen-final-flutterfire.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCK2pnyrR1qB_CSkHyPdAXxT1-UBf3BYog',
    appId: '1:522444964866:android:c7d93337a7851b886d931b',
    messagingSenderId: '522444964866',
    projectId: 'examen-final-flutterfire',
    storageBucket: 'examen-final-flutterfire.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiBjr3BWGpl0b-0mB1yu7-z7mpQbNyQS0',
    appId: '1:522444964866:ios:6beaaf39da509bc96d931b',
    messagingSenderId: '522444964866',
    projectId: 'examen-final-flutterfire',
    storageBucket: 'examen-final-flutterfire.appspot.com',
    iosClientId: '522444964866-88541i9a1tat7ldeplmg72n9qpensomt.apps.googleusercontent.com',
    iosBundleId: 'com.example.examenFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiBjr3BWGpl0b-0mB1yu7-z7mpQbNyQS0',
    appId: '1:522444964866:ios:6beaaf39da509bc96d931b',
    messagingSenderId: '522444964866',
    projectId: 'examen-final-flutterfire',
    storageBucket: 'examen-final-flutterfire.appspot.com',
    iosClientId: '522444964866-88541i9a1tat7ldeplmg72n9qpensomt.apps.googleusercontent.com',
    iosBundleId: 'com.example.examenFinal',
  );
}
