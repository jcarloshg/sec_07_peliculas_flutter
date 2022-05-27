import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sec_07_peliculas_flutter/helpers/debouncer.dart';
import 'package:sec_07_peliculas_flutter/models/models_bussiness/models_bussiness.dart';
import 'package:sec_07_peliculas_flutter/models/response/response.dart';

class MoviesProvider extends ChangeNotifier {
  // https://api.themoviedb.org/3/movie/now_playing?api_key=92f7c210e0d588078cbb3f9e58679767&language=en-ES&page=1

  final String _apiKey = '92f7c210e0d588078cbb3f9e58679767';
  final String _apiUrl = 'api.themoviedb.org';
  final String _apiLanguage = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPupularMovies = [];
  int _popularPage = 0;

  Map<int, List<Cast>> moviesCast = {};

  final Debouncer debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );
  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    getNowPlaying();
    getPopular();

    // _suggestionStreamController.close();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_apiUrl, endpoint, {
      'api_key': _apiKey,
      'language': _apiLanguage,
      'page': '$page',
    });

    final repsonse = await http.get(url);

    return repsonse.body;
  }

  getPopular() async {
    _popularPage++;

    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);

    final popular = PopularResponse.fromJson(jsonData);

    onDisplayPupularMovies = [...onDisplayPupularMovies, ...popular.results];

    notifyListeners();
  }

  getNowPlaying() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = [...nowPlayingResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData =
        await _getJsonData('/3/movie/$movieId/credits', _popularPage);

    final creditResponse = CreditResponse.fromJson(jsonData);

    if (moviesCast[movieId] == null) moviesCast[movieId] = creditResponse.cast;

    return creditResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(
      _apiUrl,
      '/3/search/movie',
      {
        'api_key': _apiKey,
        'language': _apiLanguage,
        'query': query,
      },
    );

    final repsonse = await http.get(url);
    final SearchResponse searchResponse =
        SearchResponse.fromJson(repsonse.body);

    return searchResponse.results;
  }

  void getSuggetionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovie(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(
      const Duration(milliseconds: 300),
      (timer) => {debouncer.value = searchTerm},
    );

    Future.delayed(const Duration(milliseconds: 301))
        .then((value) => timer.cancel());
  }
}
