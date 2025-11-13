import 'package:cinegod/domain/datasources/movies_datasource.dart';
import 'package:cinegod/domain/repositories/movies_repository.dart';
import 'package:cinegod/domain/entities/movie.dart';

class MovieRepositoryImpl extends MoviesRepository{
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

}