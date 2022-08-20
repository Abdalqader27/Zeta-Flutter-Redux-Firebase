import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:root/root.dart';

import '../reducer/reducer.dart';

InitResult<AppState> initStore() {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: [
      const NavigationMiddleware(),
    ],
  );

  return InitResult<AppState>(store);
}
