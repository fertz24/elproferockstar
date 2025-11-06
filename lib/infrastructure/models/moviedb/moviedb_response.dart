
class MoviedbResponse {
  final int page;
  final Dates? dates;
  final int totalResults;

  MovieDBResponse({
    required this.page, 
    required this.dates, 
    required this.results, 
    required this.totalPages, 
    required this.totalResults,
  });

}