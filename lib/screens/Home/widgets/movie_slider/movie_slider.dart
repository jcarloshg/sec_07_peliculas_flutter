import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, __) => const _MoviewPoster(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviewPoster extends StatelessWidget {
  const _MoviewPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'DatailsScreen',
              arguments: 'movie-instance',
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('http://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Start Wars: ay mama!',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
