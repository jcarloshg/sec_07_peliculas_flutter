import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sec_07_peliculas_flutter/models/response/response.dart';

class MoviesProvider extends ChangeNotifier {
  // https://api.themoviedb.org/3/movie/now_playing?api_key=92f7c210e0d588078cbb3f9e58679767&language=en-ES&page=1

  String _api_key = '92f7c210e0d588078cbb3f9e58679767';
  String _api_url = 'api.themoviedb.org';
  String _api_language = 'es-ES';

  MoviesProvider() {
    // ignore: avoid_print
    print('[MoviesProvider] init');
    getNowPlaying();
  }

  getNowPlaying() async {
    // ignore: avoid_print
    print('[getNowPlaying] ');

    var url = Uri.https(
      _api_url,
      '3/movie/now_playing',
      {
        'api_key': _api_key,
        'language': _api_language,
        'page': '1',
      },
    );

    final repsonse = await http.get(url);

    // ignore: avoid_print
    if (repsonse.statusCode != 200) return print('[ERRr] chale');

    final nowPlayingResponse = NowPlayingResponse.fromJson(repsonse.body);

    // ignore: avoid_print
    print(nowPlayingResponse.results[0].id);
  }
}
