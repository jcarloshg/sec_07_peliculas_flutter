import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';
import 'package:sec_07_peliculas_flutter/providers/movies_provider.dart';
import 'package:sec_07_peliculas_flutter/widgets/widgets.dart';

class CatingCards extends StatelessWidget {
  final int movieId;

  const CatingCards({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(
      context,
      listen:
          true, // menciona al widgets que cuando se actualicen los datos estos se deben re-dibujar
    );

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (context, AsyncSnapshot<List<Cast>> snapshot) {
        final List<Cast>? cast = snapshot.data;
        return !snapshot.hasData
            ? Container(
                constraints: const BoxConstraints(maxWidth: 30),
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                height: 180,
                child: const CupertinoActivityIndicator(),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  itemCount: cast?.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CastCard(
                      cast: cast![index],
                    );
                  },
                ),
              );
      },
    );
  }
}
