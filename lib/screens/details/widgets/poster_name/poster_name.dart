import 'package:flutter/material.dart';

class PosterName extends StatelessWidget {
  const PosterName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('http://via.placeholder.com/200x300'),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '[MOVIE-TITLE]',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '[ORIGINAL-TITLE]',
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
                    '[MOVIE-VOTE-AVERAGE]',
                    style: textTheme.caption,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
