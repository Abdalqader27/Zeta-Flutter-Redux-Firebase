import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

mixin StoreMixin<T extends StatefulWidget, S> on State<T> {
  @override
  void initState() {
    super.initState();
    _store = StoreProvider.of<S>(context, listen: false);
  }

  late final Store<S>? _store;

  Store<S> get store {
    if (_store == null) {
      throw StateError(
          'You can not access the store prior to first frame being drawn. Override postFirstFrame.');
    }
    return _store!;
  }

  void dispatch(dynamic action) {
    if (_store == null) {
      throw StateError(
          'You can not access the store prior to first frame being drawn. Override postFirstFrame.');
    }
    _store!.dispatch(action);
  }
}
