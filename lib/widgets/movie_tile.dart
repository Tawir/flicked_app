import 'package:flutter/material.dart';

//Packages
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//Models
import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;

  final double? height;
  final double? width;
  final Movie? movie;

  MovieTile({this.movie, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie!.posterURL()),
          _movieInfoWidget(),
        ],
      ),
    );
  }

Widget _movieInfoWidget() {
  return Container(
    height: height,
    width: width! * 0.67,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded( // Ensure text takes up remaining space
              child: Text(
                movie!.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              movie!.rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
        SizedBox(height: height! * 0.02),
        Text(
          '${movie!.language!.toUpperCase()} | R: ${movie!.isAdult} | ${movie!.releaseDate}',
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        SizedBox(height: height! * 0.07),
        Expanded( // Ensure description takes up remaining space
          child: SingleChildScrollView( // Enable scrolling for long descriptions
            child: Text(
              movie!.description!,
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _moviePosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width! * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageUrl),
        ),
      ),
    );
  }
}
