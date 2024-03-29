import 'package:learning_about_b4a_2_dart/app/core/models/author_model.dart';
import 'package:learning_about_b4a_2_dart/app/core/models/book_model.dart';
import 'package:learning_about_b4a_2_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_2_dart/app/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BookEntity {
  static const String className = 'Book';

  Future<BookModel> toModel(ParseObject parseObject,
      {List<String>? includeColumns}) async {
    List<AuthorModel> typeRelationAuthorList = [];
    if (includeColumns == null) {
      includeColumns = [];
      includeColumns.add('typeRelationAuthor');
    }

    //+++ get typeRelation
    if (includeColumns.contains('typeRelationAuthor')) {
      QueryBuilder<ParseObject> queryAuthor =
          QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
      queryAuthor.whereRelatedTo(
          'typeRelationAuthor', 'Book', parseObject.objectId!);
      queryAuthor.includeObject(['typePointerGenre']);
      final ParseResponse responseAuthor = await queryAuthor.query();
      if (responseAuthor.success && responseAuthor.results != null) {
        for (var e in responseAuthor.results!) {
          typeRelationAuthorList.add(AuthorEntity().toModel(e));
        }
      }
    }
    //--- get typeRelation

    BookModel model = BookModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get<String>('typeString'),
      typeBoolean: parseObject.get<bool>('typeBoolean'),
      typeNumber: parseObject.get<num>('typeNumber'),
      typeDateTime: parseObject.get<DateTime>('typeDateTime')?.toLocal(),
      typeArray: parseObject.get<List<dynamic>>('typeArray') != null
          ? parseObject
              .get<List<dynamic>>('typeArray')!
              .map((e) => e.toString())
              .toList()
          : null,
      typePointerPublisher: parseObject.get('typePointerPublisher') != null
          ? PublisherEntity()
              .toModel(parseObject.get('typePointerPublisher') as ParseObject)
          : null,
      typeRelationAuthor: typeRelationAuthorList,
    );
    return model;
  }

  ParseObject toParse(BookModel model) {
    final parseObject = ParseObject(BookEntity.className);
    if (model.objectId != null) {
      parseObject.objectId = model.objectId;
    }

    if (model.typeString != null) {
      parseObject.set('typeString', model.typeString);
    }
    if (model.typeBoolean != null) {
      parseObject.set('typeBoolean', model.typeBoolean);
    }
    if (model.typeNumber != null) {
      parseObject.set('typeNumber', model.typeNumber);
    }
    if (model.typeDateTime != null) {
      parseObject.set(
          'typeDateTime',
          DateTime(
            model.typeDateTime!.year,
            model.typeDateTime!.month,
            model.typeDateTime!.day,
            model.typeDateTime!.hour,
            model.typeDateTime!.minute,
          ));
    }
    if (model.typeArray != null) {
      parseObject.set('typeArray', model.typeArray);
    }
    if (model.typePointerPublisher != null) {
      parseObject.set(
          'typePointerPublisher',
          (ParseObject(PublisherEntity.className)
                ..objectId = model.typePointerPublisher!.objectId)
              .toPointer());
    }
    return parseObject;
  }

  ParseObject toParseUnset(String objectId, List<String> unsetFields) {
    final parseObject = ParseObject(BookEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      parseObject.unset(field);
    }

    return parseObject;
  }

  ParseObject? toParseUpdateRelationInTypeRelationAuthor({
    required String objectId,
    required List<String> modelIdList,
    required bool add,
  }) {
    final parseObject = ParseObject(BookEntity.className);
    parseObject.objectId = objectId;
    if (modelIdList.isEmpty) {
      parseObject.unset('typeRelationAuthor');
      return parseObject;
    }
    if (add) {
      parseObject.addRelation(
        'typeRelationAuthor',
        modelIdList
            .map(
              (element) =>
                  ParseObject(AuthorEntity.className)..objectId = element,
            )
            .toList(),
      );
    } else {
      parseObject.removeRelation(
          'typeRelationAuthor',
          modelIdList
              .map((element) =>
                  ParseObject(AuthorEntity.className)..objectId = element)
              .toList());
    }
    return parseObject;
  }
}
