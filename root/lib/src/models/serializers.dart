library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:root/src/models/index.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..add(DateTimeSerializer())
      ..add(DoubleSerializer())
      ..add(IntSerializer())
      ..add(MapSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

class DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  final bool structured = false;
  @override
  final Iterable<Type> types = <Type>[DateTime];
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType = FullType.unspecified}) {
    if (!dateTime.isUtc) {
      return dateTime.toUtc().microsecondsSinceEpoch;
    } else {
      return dateTime.microsecondsSinceEpoch;
    }
  }

  @override
  DateTime deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    if (serialized is String) {
      return DateTime.parse(serialized).toLocal();
    } else {
      return DateTime.fromMicrosecondsSinceEpoch(serialized as int, isUtc: true)
          .toLocal();
    }
  }
}

class DoubleSerializer implements PrimitiveSerializer<double> {
  static const String nan = 'NaN';
  static const String infinity = 'INF';
  static const String negativeInfinity = '-INF';

  final bool structured = false;
  @override
  final Iterable<Type> types = <Type>[double];
  @override
  final String wireName = 'double';

  @override
  Object serialize(Serializers serializers, double aDouble,
      {FullType specifiedType = FullType.unspecified}) {
    if (aDouble.isNaN) {
      return nan;
    } else if (aDouble.isInfinite) {
      return aDouble.isNegative ? negativeInfinity : infinity;
    } else {
      return aDouble;
    }
  }

  @override
  double deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    if (serialized == nan) {
      return double.nan;
    } else if (serialized == negativeInfinity) {
      return double.negativeInfinity;
    } else if (serialized == infinity) {
      return double.infinity;
    } else if (serialized is String) {
      return double.parse(serialized);
    } else {
      return (serialized as num).toDouble();
    }
  }
}

class IntSerializer implements PrimitiveSerializer<int> {
  final bool structured = false;
  @override
  final Iterable<Type> types = <Type>[int];
  @override
  final String wireName = 'int';

  @override
  Object serialize(Serializers serializers, int integer,
      {FullType specifiedType = FullType.unspecified}) {
    return integer;
  }

  @override
  int deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    if (serialized is String) {
      return int.parse(serialized);
    }
    return serialized as int;
  }
}

class MapSerializer implements PrimitiveSerializer<BuiltMap> {
  final bool structured = false;
  @override
  final Iterable<Type> types = <Type>[Map];
  @override
  final String wireName = 'map';

  @override
  Object serialize(Serializers serializers, BuiltMap map,
      {FullType specifiedType = FullType.unspecified}) {
    return map;
  }

  @override
  BuiltMap deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return serialized as BuiltMap;
  }
}
