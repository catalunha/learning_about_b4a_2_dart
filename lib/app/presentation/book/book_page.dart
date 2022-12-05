import 'package:learning_about_b4a_2_dart/app/presentation/book/book_search.dart';

void bookPage() {
  // BookRepository bookRepository = BookRepository();
  // bookRepository.addAll();
  // bookRepository.addRelations();
  // bookRepository.removeRelations();
  BookSearch bookSearch = BookSearch();
  // bookSearch.queryBuilderIncludeObject(
  //     ['typePointerPublisher', 'typePointerPublisher.typePointerShape']);
  // bookSearch.queryBuilderWhereEqualToRelation('Author', 'eAc886KdOl');
  // bookSearch.queryBuilderWhereMatchesQuery();
  bookSearch.queryBuilderWhereDoesNotMatchQuery();
}
