
//datasource se acerca a la capa externa
abstract class MoviesDatasource { //es una interfaz
  Future<List<Map<String, dynamic>>> getNowPlaying({int page = 1});
}