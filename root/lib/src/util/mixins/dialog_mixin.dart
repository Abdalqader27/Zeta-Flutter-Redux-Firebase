import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin DialogMixin<S extends StatefulWidget> on State<S> {
  Future show({
    required String title,
    required Object message,
    required Map<String, VoidCallback> actions,
  }) async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text('$message'),
            actions: <Widget>[
              for (String title in actions.keys)
                TextButton(
                  onPressed: actions[title],
                  child: Text(title),
                ),
            ],
          );
        },
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text('$message'),
            actions: <Widget>[
              for (String title in actions.keys)
                CupertinoDialogAction(
                  onPressed: actions[title],
                  child: Text(title),
                ),
            ],
          );
        },
      );
    }
  }
}
