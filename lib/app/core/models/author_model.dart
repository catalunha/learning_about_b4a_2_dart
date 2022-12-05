import 'dart:convert';

import 'package:learning_about_b4a_2_dart/app/core/models/genre_model.dart';

class AuthorModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDateTime;
  final List<String>? typeArray;
  final GenreModel? typePointerGenre;
  AuthorModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDateTime,
    this.typeArray,
    this.typePointerGenre,
  });

  AuthorModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDateTime,
    List<String>? typeArray,
    GenreModel? typePointerGenre,
  }) {
    return AuthorModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDateTime: typeDateTime ?? this.typeDateTime,
      typeArray: typeArray ?? this.typeArray,
      typePointerGenre: typePointerGenre ?? this.typePointerGenre,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (objectId != null) {
      result.addAll({'objectId': objectId});
    }
    if (typeString != null) {
      result.addAll({'typeString': typeString});
    }
    if (typeBoolean != null) {
      result.addAll({'typeBoolean': typeBoolean});
    }
    if (typeNumber != null) {
      result.addAll({'typeNumber': typeNumber});
    }
    if (typeDateTime != null) {
      result.addAll({'typeDateTime': typeDateTime!.millisecondsSinceEpoch});
    }
    if (typeArray != null) {
      result.addAll({'typeArray': typeArray});
    }
    if (typePointerGenre != null) {
      result.addAll({'typePointerGenre': typePointerGenre!.toMap()});
    }

    return result;
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDateTime: map['typeDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDateTime'])
          : null,
      typeArray: List<String>.from(map['typeArray']),
      typePointerGenre: map['typePointerGenre'] != null
          ? GenreModel.fromMap(map['typePointerGenre'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDateTime: $typeDateTime, typeArray: $typeArray, typePointerGenre: $typePointerGenre)';
  }
}
