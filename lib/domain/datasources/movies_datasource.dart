//datasource se acerca a la capa externa
import 'package:cinegod/domain/entities/movie.dart';

abstract class MoviesDatasource { //es una interfaz
  Future<List<Movie>> getNowPlaying({int page = 1});
}