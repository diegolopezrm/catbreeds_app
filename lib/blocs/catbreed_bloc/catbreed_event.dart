abstract class CatBreedEvent {}

class FetchCatBreeds extends CatBreedEvent {
  final String? orderBy;
  FetchCatBreeds({this.orderBy});
}


class SortCatBreeds extends CatBreedEvent {
  final String orderBy;
  SortCatBreeds(this.orderBy);
}

class SearchCatBreeds extends CatBreedEvent {
  final String query;

  SearchCatBreeds(this.query);
}
