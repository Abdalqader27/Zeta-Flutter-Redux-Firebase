import 'dart:async';

import 'package:redux/redux.dart';
import 'package:root/root.dart';

import '../reducer/reducer.dart';

InitResult<AppState> initMobile() {
  final StreamController<dynamic> controller =
      StreamController<dynamic>.broadcast();
  final Store<AppState> store = Store<AppState>(
    (AppState state, dynamic action) {
      controller.add(action);
      return reducer(state, action);
    },
    initialState: AppState.initialState(),
    middleware: <Middleware<AppState>>[],
  );

  return InitResult<AppState>(controller.stream, store);
}
