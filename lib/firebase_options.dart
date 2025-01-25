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
    apiKey: 'AIzaSyCCYDY_Dy6a53APKETeGdF_-T2qj2f5VYE',
    appId: '1:915868202980:web:63bf61df0d8ce6a10179f1',
    messagingSenderId: '915868202980',
    projectId: 'chat-app-77365',
    authDomain: 'chat-app-77365.firebaseapp.com',
    storageBucket: 'chat-app-77365.appspot.com',
    measurementId: 'G-74FYKR1NCL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3kISFu6GicBbgpg0LP_1WWExt_Erl8pw',
    appId: '1:915868202980:android:3fa798b9cb3cd3050179f1',
    messagingSenderId: '915868202980',
    projectId: 'chat-app-77365',
    storageBucket: 'chat-app-77365.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcyBLFOkX-Ok8fwaVGWftFODshyPwOEtQ',
    appId: '1:915868202980:ios:5a873084921ea36c0179f1',
    messagingSenderId: '915868202980',
    projectId: 'chat-app-77365',
    storageBucket: 'chat-app-77365.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcyBLFOkX-Ok8fwaVGWftFODshyPwOEtQ',
    appId: '1:915868202980:ios:5a873084921ea36c0179f1',
    messagingSenderId: '915868202980',
    projectId: 'chat-app-77365',
    storageBucket: 'chat-app-77365.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCCYDY_Dy6a53APKETeGdF_-T2qj2f5VYE',
    appId: '1:915868202980:web:3292959de77390d20179f1',
    messagingSenderId: '915868202980',
    projectId: 'chat-app-77365',
    authDomain: 'chat-app-77365.firebaseapp.com',
    storageBucket: 'chat-app-77365.appspot.com',
    measurementId: 'G-1EG4SZ04NG',
  );
}
