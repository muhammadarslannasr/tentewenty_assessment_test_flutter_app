import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tentwenty_assessmen_test/data/app_exceptions.dart';
import 'package:tentwenty_assessmen_test/data/network/base_api_services.dart';
import 'package:tentwenty_assessmen_test/utils/constants.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse({required String url}) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response: response);
    } on SocketException {
      throw FetchDataException(Constants.internetNotConnected_Alert);
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse({required String url, required data}) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url), body: data);

      responseJson = returnResponse(response: response);
    } on SocketException {
      throw FetchDataException(Constants.internetNotConnected_Alert);
    }

    return responseJson;
  }

  dynamic returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.body;
        return responseJson;

      case 400:
        throw BadRequestException(
            '${response.body} with Status Code ${response.statusCode}');
      case 500:
        throw BadRequestException(
            '${response.body} with Status Code ${response.statusCode}');
      case 401:
        throw UnAuthorizedException(
            '${response.body} with Status Code ${response.statusCode}');

      case 402:
        throw UnAuthorizedException(
            '${response.body} with Status Code ${response.statusCode}');

      case 403:
        throw InValidInputException(
            '${response.body} with Status Code ${response.statusCode}');

      case 404:
        throw InValidInputException(
            '${response.body} with Status Code ${response.statusCode}');
      case 302:
        throw InValidInputException(
            'The given data was invalid with Status Code ${response.statusCode}');

      case 422:
        throw InValidInputException(
            '${response.body} with Status Code ${response.statusCode}');
      default:
        throw FetchDataException(
            "Error occurred while communicating with the server with status code ${response.statusCode}");
    }
  }
}
