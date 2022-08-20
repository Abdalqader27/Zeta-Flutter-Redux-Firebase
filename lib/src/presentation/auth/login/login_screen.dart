import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:root/root.dart';

import '../../home/settings/settings_screen.dart';

class LoginScreen extends StatefulWidget {
  static const path = '/login';
  static const name = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with StoreMixin<LoginScreen, AppState> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('LoginScreen'),
                FlatButton(
                    onPressed: () {
                      store.dispatch(NavigateToAction.push(
                        SettingsScreen.path,
                      ));
                    },
                    child: Text("click"))
              ],
            ),
          ),
        ),
      );
    });
  }
}
