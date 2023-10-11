abstract class IFacadeMovie {
  Future<dynamic> getUpcomingMovies();

  Future<dynamic> getMovieDetailViaId({required int movieId});
}
