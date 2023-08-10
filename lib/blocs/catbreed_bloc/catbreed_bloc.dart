import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_event.dart';
import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catbreeds_app/models/catbreed.dart';
import 'package:catbreeds_app/repositories/catbreed_repository.dart';

class CatBreedBloc extends Bloc<CatBreedEvent, CatBreedState> {
  final CatBreedRepository _repository;

  CatBreedBloc(this._repository) : super(CatBreedInitial()) {
    on<FetchCatBreeds>((event, emit) async {
      emit(CatBreedLoading());
      try {
        List<CatBreed> breeds = await _repository.getAllBreeds();
        switch (event.orderBy) {
          case 'Name':
            breeds.sort((a, b) => a.name.compareTo(b.name));
            break;
          case 'Intelligence':
            breeds.sort((a, b) => (a.intelligence).compareTo(b.intelligence));
            break;
          case 'Affection Level':
            breeds
                .sort((a, b) => (a.affectionLevel).compareTo(b.affectionLevel));
            break;
          case 'Adaptability':
            breeds.sort((a, b) => (a.adaptability).compareTo(b.adaptability));
            break;
          case 'Life Span':
            breeds.sort((a, b) => (a.lifeSpan).compareTo(b.lifeSpan));
            break;
          default:
            break;
        }
        emit(CatBreedLoaded(breeds));
      } catch (e) {
        emit(CatBreedError(e.toString()));
      }
    });

    on<SearchCatBreeds>((event, emit) async {
      emit(CatBreedLoading());
      try {
        final List<CatBreed> allBreeds = await _repository.getAllBreeds();
        final List<CatBreed> filteredBreeds =
            _repository.searchBreedByName(allBreeds, event.query);
        emit(CatBreedLoaded(filteredBreeds));
      } catch (e) {
        emit(CatBreedError(e.toString()));
      }
    });

    // Asumiendo que tienes un evento para ordenar las razas
    on<SortCatBreeds>((event, emit) async {
      if (state is CatBreedLoaded) {
        List<CatBreed> breeds = List.from((state as CatBreedLoaded).breeds);
        if (event.orderBy == 'Name') {
          breeds.sort((a, b) => a.name.compareTo(b.name));
        } else if (event.orderBy == 'Intelligence') {
          breeds.sort((a, b) => (a.intelligence).compareTo(b.intelligence));
        }
        emit(CatBreedLoaded(breeds));
      }
    });
  }
}
