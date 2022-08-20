import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  // if (!kDebugMode) {
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // }
  runApp(const App());
  // runZonedGuarded(
  //   () => runApp(const App()),
  //   FirebaseCrashlytics.instance.recordError,
  // );
}
