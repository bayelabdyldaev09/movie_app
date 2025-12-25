import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/api/model/movies.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/tasks')
  Future<List<Movies>> getMovies();
}

RestClient initApiClient() {
  final apiUrl = dotenv.env['API_URL'];
  final dio = Dio();
  if (apiUrl != null) {
    return RestClient(dio, baseUrl: apiUrl);
  }
  return RestClient(dio); 
}