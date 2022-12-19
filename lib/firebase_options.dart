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
    apiKey: 'AIzaSyCDkoFyvufbutSHhkKxYMz5wwdyKZy9koI',
    appId: '1:174937181034:web:e6de01a9cefd1a05873313',
    messagingSenderId: '174937181034',
    projectId: 'buga-a43f9',
    authDomain: 'buga-a43f9.firebaseapp.com',
    storageBucket: 'buga-a43f9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQTht5qFIsb8QwtS4pCrSowqNrdvRrEiI',
    appId: '1:174937181034:android:537e5055f9c299f1873313',
    messagingSenderId: '174937181034',
    projectId: 'buga-a43f9',
    storageBucket: 'buga-a43f9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzskMx0Qg3LCtLdF76KYW9kNaZxJgcWFA',
    appId: '1:174937181034:ios:88f86d82bbf4f78f873313',
    messagingSenderId: '174937181034',
    projectId: 'buga-a43f9',
    storageBucket: 'buga-a43f9.appspot.com',
    iosClientId: '174937181034-tbak7e5ctssnd38ccamaclojo6h84cq8.apps.googleusercontent.com',
    iosBundleId: 'com.example.bugaCustomer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzskMx0Qg3LCtLdF76KYW9kNaZxJgcWFA',
    appId: '1:174937181034:ios:88f86d82bbf4f78f873313',
    messagingSenderId: '174937181034',
    projectId: 'buga-a43f9',
    storageBucket: 'buga-a43f9.appspot.com',
    iosClientId: '174937181034-tbak7e5ctssnd38ccamaclojo6h84cq8.apps.googleusercontent.com',
    iosBundleId: 'com.example.bugaCustomer',
  );
}
