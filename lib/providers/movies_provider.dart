import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';
import 'package:sec_07_peliculas_flutter/models/response/response.dart';

class MoviesProvider extends ChangeNotifier {
  // https://api.themoviedb.org/3/movie/now_playing?api_key=92f7c210e0d588078cbb3f9e58679767&language=en-ES&page=1

  final String _apiKey = '92f7c210e0d588078cbb3f9e58679767';
  final String _apiUrl = 'api.themoviedb.org';
  final String _apiLanguage = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPupularMovies = [];

  MoviesProvider() {
    getNowPlaying();
    getPopular();
  }

  getPopular() async {
    // https: //api.themoviedb.org/3/movie/popular?api_key=92f7c210e0d588078cbb3f9e58679767&language=en-ES&page=1
    var url = Uri.https(
      _apiUrl,
      '/3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _apiLanguage,
        'page': '1',
      },
    );

    final repsonse = await http.get(url);

    // ignore: avoid_print
    if (repsonse.statusCode != 200) return print('[ERRr] getPopular');

    final popular = PopularResponse.fromJson(repsonse.body);

    onDisplayPupularMovies = [...onDisplayPupularMovies, ...popular.results];

    // ignore: avoid_print
    print(onDisplayPupularMovies[0]);

    notifyListeners();
  }

  getNowPlaying() async {
    var url = Uri.https(
      _apiUrl,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _apiLanguage,
        'page': '1',
      },
    );

    final repsonse = await http.get(url);

    // ignore: avoid_print
    if (repsonse.statusCode != 200) return print('[ERRr] getNowPlaying');

    final nowPlayingResponse = NowPlayingResponse.fromJson(repsonse.body);

    onDisplayMovies = [...nowPlayingResponse.results];

    notifyListeners();
  }
}
