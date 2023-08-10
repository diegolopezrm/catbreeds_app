import 'package:catbreeds_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds_app/repositories/catbreed_repository.dart';

import 'blocs/catbreed_bloc/catbreed_bloc.dart';

void main() => runApp(CatBreedsApp());

class CatBreedsApp extends StatelessWidget {
  final CatBreedRepository catBreedRepository = CatBreedRepository();

  CatBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBreedBloc(catBreedRepository),
      child: MaterialApp(
        title: 'Cat Breeds',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
