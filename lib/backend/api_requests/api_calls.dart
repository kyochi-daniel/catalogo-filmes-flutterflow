import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TMDbAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDb API',
      apiUrl:
          'https://api.themoviedb.org/3/movie/now_playing?language=pt-BR&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTI3ODcxOS42MzY3OTUsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KN4FswMRCYHtd0uMCSWoALK-yKG1LD9Gai854cx4Otw',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? nowPlayingResults(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TMDBPopularCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB Popular',
      apiUrl:
          'https://api.themoviedb.org/3/movie/popular?language=pt-BR&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTI3ODcxOS42MzY3OTUsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KN4FswMRCYHtd0uMCSWoALK-yKG1LD9Gai854cx4Otw',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? mostPopular(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TmdbTvCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB TV',
      apiUrl: 'https://api.themoviedb.org/3/tv/popular?language=pt-BR&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTI3ODcxOS42MzY3OTUsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KN4FswMRCYHtd0uMCSWoALK-yKG1LD9Gai854cx4Otw',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? mostPopularTv(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TMDBEmbreveCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB Embreve',
      apiUrl:
          'https://api.themoviedb.org/3/movie/upcoming?language=pt-BR&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTMyMjYwOS43NjAyMzEsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CHO2wzTRNJe_kJPip0Ak2GqUL-2YCmdgXpFX8E99M14',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? moviesUpComming(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TMDBMoviesDetailsCall {
  static Future<ApiCallResponse> call({
    int? movieId = 278,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB MoviesDetails',
      apiUrl: 'https://api.themoviedb.org/3/movie/$movieId?language=pt-BR',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTM5MzU5My44MjU0NDIsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eq3X-o97aMfP0lCNjlDoWCRco7fA5gXCUti1AUY_PYg',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? genres(dynamic response) => (getJsonField(
        response,
        r'''$.genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TMDBCreditsCall {
  static Future<ApiCallResponse> call({
    String? movieId = '278',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB Credits',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/credits?language=pt-BR',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTM5MzU5My44MjU0NDIsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eq3X-o97aMfP0lCNjlDoWCRco7fA5gXCUti1AUY_PYg',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TMDBReviewsCall {
  static Future<ApiCallResponse> call({
    int? movieId = 278,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB Reviews',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/reviews?language=pt-BR&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTM5MzU5My44MjU0NDIsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eq3X-o97aMfP0lCNjlDoWCRco7fA5gXCUti1AUY_PYg',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TMDBSimilarCall {
  static Future<ApiCallResponse> call({
    int? movieId = 278,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB Similar',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId/similar?language=pt-BR&page=1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTM5MzU5My44MjU0NDIsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eq3X-o97aMfP0lCNjlDoWCRco7fA5gXCUti1AUY_PYg',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TMDBTvDetailsCall {
  static Future<ApiCallResponse> call({
    int? tvId = 60574,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TMDB TvDetails',
      apiUrl: 'https://api.themoviedb.org/3/tv/$tvId?language=pt-BR',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzNhMWRjMTIzMjI1NjdkYTJkNjMxZDNkODM2YTZhMCIsIm5iZiI6MTcyNTU4MTMxNC4wMTMxMTMsInN1YiI6IjY0MDRkNzllMTM2NTQ1MDA4NDZiZjc5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PJCozJF-BJV_wMCTeIwzCGwe62i6LihkFtXjfGG-VPA',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? genres(dynamic response) => (getJsonField(
        response,
        r'''$.genres[0:2]..name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic lastEpisodeToAir(dynamic response) => getJsonField(
        response,
        r'''$.last_episode_to_air''',
      );
  static List? seasons(dynamic response) => getJsonField(
        response,
        r'''$.seasons''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
