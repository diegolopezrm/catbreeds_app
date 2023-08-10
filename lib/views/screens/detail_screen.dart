import 'package:catbreeds_app/views/widgets/catbreed_stars_level.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds_app/models/catbreed.dart';

class DetailScreen extends StatelessWidget {
  final CatBreed breed;

  const DetailScreen({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text(breed.name.toString()),
      ),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Hero(
                tag: "catImage-${breed.referenceImageId}",
                child: Image.network(
                  "https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg",
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/cat_placeholder.gif',
                        fit: BoxFit.cover, height: 300, width: double.infinity);
                  },
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20.0),
                ListTile(
                  title: const Text('Description'),
                  subtitle: Text(breed.description.toString()),
                ),
                ListTile(
                  title: const Text('Origin'),
                  subtitle: Text(breed.origin.toString()),
                ),
                ListTile(
                  title: const Text('Intelligence'),
                  subtitle: CatBreedStarLevel(level: breed.intelligence),
                ),
                ListTile(
                  title: const Text('Adaptability'),
                  subtitle: CatBreedStarLevel(level: breed.adaptability),
                ),
                ListTile(
                  title: const Text('Life Span'),
                  subtitle: Text('${breed.lifeSpan} years'),
                ),
                ListTile(
                  title: const Text('Affection Level'),
                  subtitle: CatBreedStarLevel(level: breed.affectionLevel),
                ),
                ListTile(
                  title: const Text('Child Friendly'),
                  subtitle: CatBreedStarLevel(level: breed.childFriendly),
                ),
                ListTile(
                  title: const Text('Dog Friendly'),
                  subtitle: CatBreedStarLevel(level: breed.dogFriendly),
                ),
                ListTile(
                  title: const Text('Energy Level'),
                  subtitle: CatBreedStarLevel(level: breed.energyLevel),
                ),
                ListTile(
                  title: const Text('Grooming'),
                  subtitle: CatBreedStarLevel(level: breed.grooming),
                ),
                ListTile(
                  title: const Text('Health Issues'),
                  subtitle: CatBreedStarLevel(level: breed.healthIssues),
                ),
                ListTile(
                  title: const Text('Shedding Level'),
                  subtitle: CatBreedStarLevel(level: breed.sheddingLevel),
                ),
                ListTile(
                  title: const Text('Social Needs'),
                  subtitle: CatBreedStarLevel(level: breed.socialNeeds),
                ),
                ListTile(
                  title: const Text('Stranger Friendly'),
                  subtitle: CatBreedStarLevel(level: breed.strangerFriendly),
                ),
                ListTile(
                  title: const Text('Vocalisation'),
                  subtitle: CatBreedStarLevel(level: breed.vocalisation),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
