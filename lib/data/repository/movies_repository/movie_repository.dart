import 'package:tentwenty_assessmen_test/data/network/base_api_services.dart';
import 'package:tentwenty_assessmen_test/data/network/network_api_service.dart';
import 'package:tentwenty_assessmen_test/data/repository/movies_repository/i_facade_movie.dart';
import 'package:tentwenty_assessmen_test/utils/api_urls.dart';
import 'package:tentwenty_assessmen_test/utils/app_config.dart';

class MovieRepository extends IFacadeMovie {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future getUpcomingMovies() {
    try {
      dynamic response = _apiServices.getGetApiResponse(
        url: ApiUrls.upComingMoviesURL,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getMovieDetailViaId({required int movieId}) {
    try {
      dynamic response = _apiServices.getGetApiResponse(
        url: '${ApiUrls.getMovieByIdURL}$movieId?api_key=${AppConfig.apiKey}',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
