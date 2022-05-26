import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';
import 'package:sec_07_peliculas_flutter/screens/details/widgets/widgets.dart';
import 'package:sec_07_peliculas_flutter/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            backdropPath: movie.fullBackdropPath,
            title: movie.title,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                PosterName(
                  title: movie.title,
                  originalTitle: movie.originalTitle,
                  voteAverage: movie.voteAverage,
                  posterPath: movie.fullPosterImg,
                ),
                Overview(overview: movie.overview),
                Overview(overview: movie.overview),
                Overview(overview: movie.overview),
                CatingCards(movieId: movie.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
