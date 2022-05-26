import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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
  int _popularPage = 0;

  MoviesProvider() {
    getNowPlaying();
    getPopular();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_apiUrl, endpoint, {
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
}
