// const ActionReporting _reporting = ActionReporting();

import 'package:root/root.dart';

AppState reducer(AppState state, dynamic action) {
  return state.rebuild((builder) => builder);
}
