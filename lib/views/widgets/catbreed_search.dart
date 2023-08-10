import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_bloc.dart';
import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_event.dart';
import 'package:catbreeds_app/blocs/catbreed_bloc/catbreed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds_app/models/catbreed.dart';

class CatBreedSearch extends SearchDelegate<CatBreed?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<CatBreedBloc>(context).add(SearchCatBreeds(query));
    return BlocBuilder<CatBreedBloc, CatBreedState>(
      builder: (context, state) {
        if (state is CatBreedLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CatBreedLoaded) {
          return ListView.builder(
            itemCount: state.breeds.length,
            itemBuilder: (context, index) {
              final breed = state.breeds[index];
              return ListTile(
                title: Text(breed.name.toString()),
                onTap: () {
                  close(context, breed);
                },
              );
            },
          );
        } else if (state is CatBreedError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
