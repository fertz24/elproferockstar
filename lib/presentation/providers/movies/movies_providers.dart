import 'package:cinegod/domain/entities/movie.dart';
import 'package:cinegod/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = //funcion para notificar
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) { //Devuelve un List Movie
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

typedef MovieCallBack = Future<List<Movie>> Function({int page}); //typefer es el nombre de un conjunto de interfaz para una funcion

class MoviesNotifier extends StateNotifier<List<Movie>> { //Se indica el mismo valor que se va a devolver
  int currentPage = 0;
  final MovieCallBack fetchMoreMovies; //Tiene el mismo nombre que la linea de arriba
  MoviesNotifier({required this.fetchMoreMovies}) : super([]); //Que no este amarrado al MoviesNotifier

  Future<void> loadNextPage() async { //Funcion para cargar a la siguiente pagina
    currentPage++;
    await Future.delayed(Duration(seconds: 2)); // Simular tiempo de espera
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies]; //Se concatena el estado actual mas el cambio, state es del stateNotifier
  }
}