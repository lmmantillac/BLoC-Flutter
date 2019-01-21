import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:movies_app/src/models/item_model.dart';

class MoviesApiProvider {
  Client client = Client();
  final _apiKey = '334e246dda43cdc25df8a6c442e4fb21';
  
  Future<ItemModel> fetchMovieList() async{
    print("entered");
    final response = await client
      .get("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post!!!');
    }
  }

}