import 'package:learning_about_b4a_2_dart/app/core/models/genre_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreEntity {
  static const String className = 'Genre';
  static const String typeString = 'typeString';
  static const String typeBoolean = 'typeBoolean';
  static const String typeNumber = 'typeNumber';
  static const String typeDateTime = 'typeDateTime';
  static const String typeArray = 'typeArray';
  GenreModel toModel(ParseObject parseObject) {
    GenreModel model = GenreModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get<String>(typeString),
      typeBoolean: parseObject.get<bool>(typeBoolean),
      typeNumber: parseObject.get<num>(typeNumber),
      typeDateTime: parseObject.get<DateTime>(typeDateTime)?.toLocal(),
      typeArray: parseObject.get<List<dynamic>>(typeArray) != null
          ? parseObject
              .get<List<dynamic>>(typeArray)!
              .map((e) => e.toString())
              .toList()
          : null,
    );
    return model;
  }

  ParseObject toParse(GenreModel model) {
    final parseObject = ParseObject(GenreEntity.className);
    if (model.objectId != null) {
      parseObject.objectId = model.objectId;
    }

    if (model.typeString != null) {
      parseObject.set(typeString, model.typeString);
    }
    if (model.typeBoolean != null) {
      parseObject.set(typeBoolean, model.typeBoolean);
    }
    if (model.typeNumber != null) {
      parseObject.set(typeNumber, model.typeNumber);
    }
    if (model.typeDateTime != null) {
      parseObject.set(
          typeDateTime,
          DateTime(
            model.typeDateTime!.year,
            model.typeDateTime!.month,
            model.typeDateTime!.day,
            model.typeDateTime!.hour,
            model.typeDateTime!.minute,
          ));
    }

    if (model.typeArray != null) {
      parseObject.set(typeArray, model.typeArray);
    }

    return parseObject;
  }

  Future<void> toParseUnset(String objectId, List<String> unsetFields) async {
    final parseObject = ParseObject(GenreEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      await parseObject.unset(field);
    }
  }
}
