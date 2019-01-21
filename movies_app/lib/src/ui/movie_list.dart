import 'package:flutter/material.dart';
import 'package:movies_app/src/models/item_model.dart';
import 'package:movies_app/src/blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<ItemModel> snapshot){
            if(snapshot.hasData){
              return buildList(snapshot);
            }
            else return Container(width: 0.0, height: 0.0);
          }
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot){
    return GridView.builder(
      itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
            fit: BoxFit.cover,
          );
        }
    );
  }
}
