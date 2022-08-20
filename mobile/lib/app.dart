import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:root/root.dart';
import 'package:zeta/src/init/init.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with InitMixin<App, AppState> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(body: Text('Hello World')),
      ),
    );
  }

  @override
  InitResult<AppState> init() => initStore();
}
