import 'package:cinegod/config/constants/environment.dart';
import 'package:cinegod/domain/datasources/movies_datasource.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
    baseUrl: Environment.theBaseUrl,
    queryParameters: {'api_key': Environment.key, 'language': 'es-MX'},
  ),
);

  @override
  Future<List<Map<String, dynamic>>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = response.data;

    return  List<Map<String, dynamic>>.from(response.data['results']);
  } 
}