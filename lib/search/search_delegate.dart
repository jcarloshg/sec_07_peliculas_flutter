import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';
import 'package:sec_07_peliculas_flutter/providers/movies_provider.dart';
import 'package:sec_07_peliculas_flutter/widgets/widgets.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Busca peliculas...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  Widget _searchMovieEmpty(String label) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.movie_creation_outlined,
            size: 100,
            color: Colors.grey,
          ),
          Text(label)
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ignore: avoid_print
    print(query);

    if (query.isEmpty) return _searchMovieEmpty(query);

    final MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) {
          return _searchMovieEmpty('No hay pelis relacionadas');
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.5,
          ),
          itemCount: snapshot.data?.length,
          itemBuilder: (BuildContext context, int index) =>
              ListTitleMovie(movie: snapshot.data![index]),
        );

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) =>
              ListTitleMovie(movie: snapshot.data![index]),
        );
      },
    );
  }
}
