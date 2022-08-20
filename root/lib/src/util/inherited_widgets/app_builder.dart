import 'package:flutter/cupertino.dart';

class AppThemeBuilder extends StatefulWidget {
  const AppThemeBuilder({Key? key, required this.builder}) : super(key: key);
  final Function(BuildContext) builder;

  @override
  State<AppThemeBuilder> createState() => _AppBuilderState();

  static State<AppThemeBuilder>? of(BuildContext context) {
    return context.findAncestorStateOfType<_AppBuilderState>();
  }
}

class _AppBuilderState extends State<AppThemeBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() => setState(() {});
}
