import 'package:learning_about_b4a_2_dart/app/data/b4a/tables/shape/shape_repository.dart';
import 'package:learning_about_b4a_2_dart/app/presentation/shape/shape_search.dart';

void shapePage() {
  ShapeRepository shapeRepository = ShapeRepository();
  // shapeRepository.addAll();
  shapeRepository.addFile('readme/db_relation.jpg', '5qSDm1dxq6');

  ShapeSearch shapeSearch = ShapeSearch();
  shapeSearch.getObject('5qSDm1dxq6');
}
