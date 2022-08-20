import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

class InitResult<S> {
  const InitResult(this.store);

  final Store<S> store;
}

mixin InitMixin<T extends StatefulWidget, S> on State<T> {
  late Store<S> _store;

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
      _store = store;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
    }
  }

  Store<S> get store => _store;
}
