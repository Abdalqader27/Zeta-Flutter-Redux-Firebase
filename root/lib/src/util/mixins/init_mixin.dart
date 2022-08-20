import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

class InitResult<S> {
  const InitResult(this.actions, this.store);

  final Stream<dynamic> actions;
  final Store<S> store;
}

mixin InitMixin<T extends StatefulWidget, S> on State<T> {
  final Completer<Store<S>> _completer = Completer<Store<S>>();
  late Store<S> _store;
  late Stream<dynamic> _actions;

  InitResult<S> init();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    try {
      final InitResult<S> result = init();
      final Store<S> store = result.store;
      _completer.complete(store);
      _store = store;
      _actions = result.actions;
    } catch (e, s) {
      _completer.completeError(e, s);
      FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

  Future<Store<S>> get initFuture => _completer.future;

  Store<S> get store => _store;

  Stream<dynamic> get actions => _actions;
}
