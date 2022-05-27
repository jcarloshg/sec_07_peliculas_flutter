import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';

class PosterName extends StatelessWidget {
  final String title;
  final String originalTitle;
  final double voteAverage;
  final String posterPath;
  final String id;

  const PosterName({
    Key? key,
    required this.title,
    required this.originalTitle,
    required this.voteAverage,
    required this.posterPath,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(posterPath),
                fit: BoxFit.cover,
                height: 200,
                width: 130,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outlined,
                      size: 16,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$voteAverage',
                      style: textTheme.caption,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
