import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';

class ListTitleMovie extends StatelessWidget {
  final Movie movie;

  const ListTitleMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        'DatailsScreen',
        arguments: movie,
      ),
      child: Container(
        child: Column(
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              movie.originalTitle,
              style: Theme.of(context).textTheme.overline,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
    // ListTile(
    //   title: Text(movie.title),
    //   subtitle: Text(movie.originalTitle),
    //   leading: FadeInImage(
    //     placeholder: const AssetImage('assets/no-image.jpg'),
    //     image: NetworkImage(movie.fullPosterImg),
    //     width: 50,
    //     height: 300,
    //     fit: BoxFit.contain,
    //   ),
    //   onTap: () => Navigator.pushNamed(
    //     context,
    //     'DatailsScreen',
    //     arguments: movie,
    //   ),
    // );
  }
}
