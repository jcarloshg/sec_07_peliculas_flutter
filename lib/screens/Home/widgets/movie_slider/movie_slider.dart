import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/movie.dart';
import 'package:sec_07_peliculas_flutter/widgets/widgets.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    Key? key,
    required this.movies,
    required this.onNextPage,
    this.title,
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final pixels = scrollController.position.pixels;
      final maxPixels = scrollController.position.maxScrollExtent;
      final diferencePixels = pixels - maxPixels;
      if (diferencePixels > 50 && diferencePixels < 55) widget.onNextPage();
    });
  }

  @override
  void dispose() {
    // se llama cuando este va a ser destruido
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              itemBuilder: (_, index) =>
                  MoviewPoster(movie: widget.movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}
