import 'package:dio/dio.dart';

import '../errors/custom_excption.dart';
import '../errors/failure.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post({
    required String url,
    String? token,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    try {
      // Map<String, String> headers = {};

      // if (token != null) {
      //   headers['Authorization'] = 'Bearer $token';
      // }

      var response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: headers ?? {'Authorization': 'Bearer $token'},
          contentType: contentType,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        errMessage: ServerFailure.fromDioException(e).errMessage,
      );
    }
  }
}
