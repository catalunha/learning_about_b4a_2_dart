import 'package:learning_about_b4a_2_dart/app/presentation/genre/genre_search.dart';

void genrePage() {
  // GenreRepository genreRepository = GenreRepository();
  // genreRepository.add();
  // genreRepository.update();
  // genreRepository.addAll();
  // genreRepository.delete('3PplSH1UZd');
  // genreRepository.unset('3PplSH1UZd', GenreEntity.typeString);
  // genreRepository.typeNumberIncrement('3PplSH1UZd', 10);
  // genreRepository.typeNumberDecrement('3PplSH1UZd', 5);
  // genreRepository.typeArraySetAdd('3PplSH1UZd', 'a');
  // genreRepository.typeArraySetAddUnique('3PplSH1UZd', 'aa');
  // genreRepository.typeArraySetAddAll('3PplSH1UZd', ['aa', 'd', 'f']);
  // genreRepository.typeArraySetAddAllUnique('3PplSH1UZd', ['aa', 'd', 'f']);
  // genreRepository.typeArraySetRemove('3PplSH1UZd', 'a');
  // genreRepository.typeArraySetRemoveAll('3PplSH1UZd', ['aa', 'd', 'g']);
  GenreSearch genreSearch = GenreSearch();
  // genreSearch.getAll();
  // genreSearch.getObject('3PplSH1UZd');
  // genreSearch.count();
  // genreSearch.queryBuilder();
  // genreSearch.queryBuilderOrderByAscending('typeString');
  // genreSearch.queryBuilderOrderByDescending('typeString');
  // genreSearch.queryBuilderExcludeKeys(['typeString']);
  // genreSearch.queryBuilderKeysToReturn(['typeString']);
  // genreSearch.queryBuilderPagination(1, 2);
  // genreSearch.queryBuilderPagination(2, 2);
  // genreSearch.queryBuilderWhereEqualToSimpleColumn('typeBoolean', true);
  // genreSearch.queryBuilderWhereEqualToSimpleColumn('typeString', 'Genre01');
  // genreSearch.queryBuilderWhereEqualToSimpleColumn('typeNumber', 3);
  genreSearch.queryBuilderWhereEqualToSimpleColumn(
      'typeDateTime', DateTime(2022, 12, 02, 16, 42, 36, 243));
}
