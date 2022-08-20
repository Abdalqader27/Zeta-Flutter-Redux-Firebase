import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:root/root.dart';
import 'package:zeta/router/router.dart';
import 'package:zeta/src/init/init.dart';

import 'generated/l10n.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with InitMixin<App, AppState> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: AppThemeBuilder(builder: (context) {
          return MaterialApp(
            navigatorKey: NavigatorHolder.navigatorKey,
            onGenerateRoute: getRouter,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            builder: (context, navigator) {
              navigator = ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, navigator!),
                mediaQueryData: MediaQuery.of(context),
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
              );
              var lang = Localizations.localeOf(context).languageCode;
              return navigator;
              // return Theme(
              //   child: navigator,
              // );
            },
          );
        }));
  }

  @override
  InitResult<AppState> init() => initStore();
}
