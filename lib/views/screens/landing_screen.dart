import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_bloc.dart';
import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_event.dart';
import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_state.dart';
import 'package:catbreeds_app/views/screens/detail_screen.dart';
import 'package:catbreeds_app/views/widgets/catbreed_stars_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CatBreedBloc>().add(FetchCatBreeds());
    });

    _searchController.addListener(() {
      context.read<CatBreedBloc>().add(SearchCatBreeds(_searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/cat.png', width: 30),
            const Text('Cat Breeds',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ],
        ),
        leading: const SizedBox(),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              context.read<CatBreedBloc>().add(FetchCatBreeds(orderBy: value));
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Name',
                child: Text('Ordenar por nombre'),
              ),
              const PopupMenuItem<String>(
                value: 'Intelligence',
                child: Text('Ordenar por inteligencia'),
              ),
              const PopupMenuItem<String>(
                value: 'Affection Level',
                child: Text('Ordenar por nivel de afecto'),
              ),
              const PopupMenuItem<String>(
                value: 'Adaptability',
                child: Text('Ordenar por adaptabilidad'),
              ),
              const PopupMenuItem<String>(
                value: 'Life Span',
                child: Text('Ordenar por esperanza de vida'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CatBreedBloc, CatBreedState>(
              builder: (context, state) {
                if (state is CatBreedLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CatBreedLoaded) {
                  return ListView.builder(
                    itemCount: state.breeds.length,
                    itemBuilder: (context, index) {
                      final breed = state.breeds[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(breed: breed),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            breed.name.toString(),
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_forward_ios),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    height: 300,
                                    child: Hero(
                                      tag: "catImage-${breed.referenceImageId}",
                                      child: Image.network(
                                        "https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg",
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/images/cat_placeholder.gif',
                                              fit: BoxFit.cover,
                                              height: 300,
                                              width: double.infinity);
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                ListTile(
                                  title: Text(breed.origin.toString()),
                                  subtitle: const Text('Origin'),
                                  trailing: CatBreedStarLevel(
                                      level: breed.intelligence,
                                      showText: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is CatBreedError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
