import 'package:catbreeds_app/models/catbreed.dart';
import 'package:catbreeds_app/services/api_service.dart';

class CatBreedRepository {
  final ApiService _apiService = ApiService();

  // Fetch all cat breeds
  Future<List<CatBreed>> getAllBreeds() async {
    return await _apiService.fetchAllBreeds();
  }

  // Search for a specific breed by name
  List<CatBreed> searchBreedByName(List<CatBreed> breeds, String query) {
    return _apiService.searchBreedByName(breeds, query);
  }
}
