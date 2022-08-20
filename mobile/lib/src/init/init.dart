import 'package:redux/redux.dart';
import 'package:root/root.dart';

import '../reducer/reducer.dart';

InitResult<AppState> initStore() {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: <Middleware<AppState>>[],
  );

  return InitResult<AppState>(store);
}
