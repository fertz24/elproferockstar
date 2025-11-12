import 'package:cinegod/config/constants/environment.dart';
import 'package:cinegod/domain/datasources/movies_datasource.dart';
import 'package:cinegod/domain/entities/movie.dart';
import 'package:cinegod/infrastructure/mappers/movie_mapper.dart';
import 'package:cinegod/infrastructure/models/moviedb/moviedb_response.dart';
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
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
    .toList();

    return  List<Map<String, dynamic>>.from(response.data['results']);
  } 
}