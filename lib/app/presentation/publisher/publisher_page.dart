import 'package:learning_about_b4a_2_dart/app/data/b4a/tables/publisher/publisher_repository.dart';
import 'package:learning_about_b4a_2_dart/app/presentation/publisher/publisher_search.dart';

void publisherPage() {
  PublisherRepository publisherRepository = PublisherRepository();
  publisherRepository.addAll();

  PublisherSearch publisherSearch = PublisherSearch();
  publisherSearch.getObject('ICMVRggwE4');
}
