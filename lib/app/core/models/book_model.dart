import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:learning_about_b4a_2_dart/app/core/models/author_model.dart';
import 'package:learning_about_b4a_2_dart/app/core/models/publisher_model.dart';

class BookModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDateTime;
  final List<String>? typeArray;
  final PublisherModel? typePointerPublisher;
  final List<AuthorModel>? typeRelationAuthor;
  BookModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDateTime,
    this.typeArray,
    this.typePointerPublisher,
    this.typeRelationAuthor,
  });

  BookModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDateTime,
    List<String>? typeArray,
    PublisherModel? typePointerPublisher,
    List<AuthorModel>? typeRelationAuthor,
  }) {
    return BookModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDateTime: typeDateTime ?? this.typeDateTime,
      typeArray: typeArray ?? this.typeArray,
      typePointerPublisher: typePointerPublisher ?? this.typePointerPublisher,
      typeRelationAuthor: typeRelationAuthor ?? this.typeRelationAuthor,
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
    if (typePointerPublisher != null) {
      result.addAll({'typePointerPublisher': typePointerPublisher!.toMap()});
    }
    if (typeRelationAuthor != null) {
      result.addAll({
        'typeRelationAuthor': typeRelationAuthor!.map((x) => x.toMap()).toList()
      });
    }

    return result;
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDateTime: map['typeDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDateTime'])
          : null,
      typeArray: List<String>.from(map['typeArray']),
      typePointerPublisher: map['typePointerPublisher'] != null
          ? PublisherModel.fromMap(map['typePointerPublisher'])
          : null,
      typeRelationAuthor: map['typeRelationAuthor'] != null
          ? List<AuthorModel>.from(
              map['typeRelationAuthor']?.map((x) => AuthorModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDateTime: $typeDateTime, typeArray: $typeArray, typePointerPublisher: $typePointerPublisher, typeRelationAuthor: $typeRelationAuthor)';
  }
}
