import 'package:tentwenty_assessmen_test/utils/app_config.dart';

class ApiUrls{
  static const String base = 'https://api.themoviedb.org';
  static const String upComingMoviesURL = '$base/3/movie/upcoming?api_key=${AppConfig.apiKey}';
  static const String getMovieByIdURL = '$base/3/movie/';
}