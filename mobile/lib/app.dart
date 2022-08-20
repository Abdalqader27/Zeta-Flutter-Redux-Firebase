import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
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
    return FutureBuilder(
        future: initFuture,
        builder: (context, AsyncSnapshot<Store<AppState>> snapshot) {
          return StoreProvider<AppState>(
              store: snapshot.data!, child: Container());
        });
  }

  @override
  InitResult<AppState> init() => initMobile();
}
