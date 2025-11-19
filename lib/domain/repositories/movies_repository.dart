import 'package:cinegod/domain/entities/movie.dart';

//en repository tmb es una interfaz y se hacen consultas, a que datasource nos vamos a dirigir

abstract class MoviesRepository { 
  Future<List<Movie>> getNowPlaying({int page = 1}); //Obtener lo que se esta reproduciendo hoy
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
}