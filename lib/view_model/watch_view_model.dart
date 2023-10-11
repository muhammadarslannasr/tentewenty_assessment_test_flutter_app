import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tentwenty_assessmen_test/data/repository/movies_repository/movie_repository.dart';
import 'package:tentwenty_assessmen_test/data/response/api_response.dart';
import 'package:tentwenty_assessmen_test/models/movies_detail_model.dart';
import 'package:tentwenty_assessmen_test/models/movies_list.dart';

class WatchViewModel with ChangeNotifier {
  final _movieRepo = MovieRepository();

  ApiResponse<MoviesList> movies = ApiResponse.loading();

  setMovies(ApiResponse<MoviesList> response) {
    movies = response;
    notifyListeners();
  }

  Future<void> getMovies() async {
    await _movieRepo.getUpcomingMovies().then((response) {
      MoviesList moviesList = MoviesList.fromJson(jsonDecode(response));
      setMovies(ApiResponse.completed(data: moviesList));
    }).onError((error, stackTrace) {
      setMovies(ApiResponse.error(message: error.toString()));
      debugPrint('ERROR: ${error.toString()}');
    });
  }

  ApiResponse<MoviesDetailModel> movieDetail = ApiResponse.loading();

  setMovieDetail(ApiResponse<MoviesDetailModel> response) {
    movieDetail = response;
    notifyListeners();
  }

  Future<void> getMovieDetailById({required int movieId}) async {
    await _movieRepo.getMovieDetailViaId(movieId: movieId).then((response) {
      MoviesDetailModel moviesDetailModel =
          MoviesDetailModel.fromJson(jsonDecode(response));
      setMovieDetail(ApiResponse.completed(data: moviesDetailModel));
    }).onError((error, stackTrace) {
      setMovieDetail(ApiResponse.error(message: error.toString()));
      debugPrint('ERROR: ${error.toString()}');
    });
  }
}
