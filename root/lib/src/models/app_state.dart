part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {});
  }

  factory AppState() = _$AppState;

  factory AppState.fromJson(Map<dynamic, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;

  AppState._();

  Map<String, dynamic>? get json =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>?;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
