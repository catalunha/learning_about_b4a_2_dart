import 'dart:developer';

import 'package:learning_about_b4a_2_dart/app/core/models/genre_model.dart';
import 'package:learning_about_b4a_2_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreSearch {
  GenreSearch() {
    log('=== GenreSearch ===');
  }

  /// Retorna todos os objetos da class
  void getAll() async {
    log('+++ getAll +++');
    var list = <GenreModel>[];
    final parseResponse = await ParseObject(GenreEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... getAll ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- getAll ---');
  }

  /// Retorna um objeto da class baseado no seu [objectId]
  void getObject(String objectId) async {
    log('+++ getObject +++');
    GenreModel? genreModel;
    final parseResponse =
        await ParseObject(GenreEntity.className).getObject(objectId);
    if (parseResponse.success && parseResponse.results != null) {
      genreModel = GenreEntity().toModel(parseResponse.results!.first);
    }
    log('... getObject ...');
    if (genreModel == null) {
      log('null');
    } else {
      log(genreModel.toString());
    }
    log('--- getObject ---');
  }

  /// Retorna a quantidade de objetos da query
  void count() async {
    log('+++ count +++');
    int result = -1;
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    var parseResponse = await queryBuilder.count();
    if (parseResponse.success && parseResponse.results != null) {
      result = parseResponse.count;
    }

    log('... count ...');
    log(result.toString());
    log('--- count ---');
  }

  /// Constroi a consulta com todos os objetos da class
  /// Pois neste caso a queryBuilder não tem restrições
  void queryBuilder() async {
    log('+++ queryBuilder +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    //Sem condição de busca. Retorna todos.
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilder ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilder ---');
  }

  /// Constroi a consulta em ordem crescente para este atributo
  void queryBuilderOrderByAscending(String columnName) async {
    log('+++ queryBuilderOrderByAscending +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.orderByAscending(columnName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderOrderByAscending ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByAscending ---');
  }

  /// Constroi a consulta em ordem decrescente para este atributo
  void queryBuilderOrderByDescending(String columnName) async {
    log('+++ queryBuilderOrderByDescending +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.orderByDescending(columnName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderOrderByDescending ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByDescending ---');
  }

  /// Constroi a consulta excluindo esta lista de atributos nos objetos retornados
  void queryBuilderExcludeKeys(List<String> columnsName) async {
    log('+++ queryBuilderExcludeKeys +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.excludeKeys(columnsName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderExcludeKeys ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderExcludeKeys ---');
  }

  /// Constroi a consulta com apenas esta lista de atributos nos objetos retornados
  void queryBuilderKeysToReturn(List<String> columnsName) async {
    log('+++ queryBuilderKeysToReturn +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.keysToReturn(columnsName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderKeysToReturn ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderKeysToReturn ---');
  }

  /// Constroi a consulta com uma quantidade de objetos após saltar certa
  /// quantidade de objetos.
  /// A junção destas faz a paginação dos objetos retornados.
  void queryBuilderPagination(int page, int limit) async {
    log('+++ queryBuilderPagination +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.setAmountToSkip((page - 1) * limit);
    queryBuilder.setLimit(limit);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderPagination ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderPagination ---');
  }

  /// Constroi a consulta onde um [atributo] é igual a um [valor]
  void queryBuilderWhereEqualToSimpleColumn(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereEqualToSimpleColumn +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereEqualToSimpleColumn ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToSimpleColumn ---');
  }
}
