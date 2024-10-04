import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/features/movies/data/model/movie_details_model.dart';
import 'package:movies/features/movies/data/model/movies_model.dart';
import 'package:movies/features/movies/data/model/recommendation_model.dart';
import 'package:movies/features/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_recommendation_use_case.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameter parameters);
}
class MovieRemoteDataSource extends BaseMoviesRemoteDataSource {

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async{
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if(response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
              (e) => MoviesModel.fromJson(e),
      ));
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if(response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if(response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if(response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameter parameters) async {
    final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List).map(
                (e) => RecommendationModel.fromJson(e),
          ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
