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
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${Environment.key}',
    },
    queryParameters: {'language': 'es-MX'},
  ),
);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
    .toList();

    return movies;
  } 
}