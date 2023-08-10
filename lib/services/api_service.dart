import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:catbreeds_app/models/catbreed.dart';

class ApiService {
  final String _baseUrl = 'https://api.thecatapi.com/v1/breeds';
  final String _apiKey = 'bda53789-d59e-46cd-9bc4-2936630fde39';

  // Fetch all cat breeds
  Future<List<CatBreed>> fetchAllBreeds() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => CatBreed.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }

  // Search for a specific breed by name
  List<CatBreed> searchBreedByName(List<CatBreed> breeds, String query) {
    return breeds
        .where((breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
