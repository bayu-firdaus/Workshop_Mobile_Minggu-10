import 'dart:convert';

import 'package:minggu10_tmdb/model/popular_movies.dart';
import 'package:http/http.dart'  show Client, Response;

class ApiProvider{
  String apiKey = 'c18805cae23d66b5070d6ab76d541bbd';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async{

   Response response =

   await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

   if(response.statusCode == 200){
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}