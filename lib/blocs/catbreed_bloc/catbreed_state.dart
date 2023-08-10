import '../../models/catbreed.dart';

abstract class CatBreedState {}

class CatBreedInitial extends CatBreedState {}

class CatBreedLoading extends CatBreedState {}

class CatBreedLoaded extends CatBreedState {
  final List<CatBreed> breeds;

  CatBreedLoaded(this.breeds);
}

class CatBreedError extends CatBreedState {
  final String message;

  CatBreedError(this.message);
}
