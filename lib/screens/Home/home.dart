import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_07_peliculas_flutter/providers/movies_provider.dart';
import 'package:sec_07_peliculas_flutter/screens/Home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(
      context,
      listen:
          true, // menciona al widgets que cuando se actualicen los datos estos se deben re-dibujar
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            const SizedBox(height: 10),
            MovieSlider(
              movies: moviesProvider.onDisplayPupularMovies,
              title: 'Pelis populares',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
