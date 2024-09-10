import '/backend/api_requests/api_calls.dart';
import '/components/big_movie_card/big_movie_card_widget.dart';
import '/components/cast_card/cast_card_widget.dart';
import '/components/movie_card/movie_card_widget.dart';
import '/components/review_card/review_card_widget.dart';
import '/components/section_cast/section_cast_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'movie_details_model.dart';
export 'movie_details_model.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({
    super.key,
    required this.moveId,
  });

  final int? moveId;

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  late MovieDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: TMDBMoviesDetailsCall.call(
        movieId: widget.moveId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final movieDetailsTMDBMoviesDetailsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 500.0,
                ),
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.bigMovieCardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BigMovieCardWidget(
                          image:
                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.backdrop_path''',
                          ).toString()}',
                          title: getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.title''',
                          ).toString(),
                          rating: getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.vote_average''',
                          ),
                          releaseYear: getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.release_date''',
                          ).toString(),
                          genres: getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.genres[0:2]..name''',
                          ).toString(),
                          duration: getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.runtime''',
                          ).toString(),
                          numOfVotes: getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.vote_count''',
                          ).toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          'História',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          getJsonField(
                            movieDetailsTMDBMoviesDetailsResponse.jsonBody,
                            r'''$.overview''',
                          ).toString(),
                          maxLines: 5,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: wrapWithModel(
                          model: _model.sectionCastModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const SectionCastWidget(
                            title: 'Cast',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: TMDBCreditsCall.call(
                              movieId: widget.moveId?.toString(),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final listViewTMDBCreditsResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final creditsLV = getJsonField(
                                    listViewTMDBCreditsResponse.jsonBody,
                                    r'''$.cast''',
                                  ).toList().take(6).toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: creditsLV.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 8.0),
                                    itemBuilder: (context, creditsLVIndex) {
                                      final creditsLVItem =
                                          creditsLV[creditsLVIndex];
                                      return CastCardWidget(
                                        key: Key(
                                            'Keymu1_${creditsLVIndex}_of_${creditsLV.length}'),
                                        image:
                                            'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${getJsonField(
                                          creditsLVItem,
                                          r'''$.profile_path''',
                                        ).toString()}',
                                        name: getJsonField(
                                          creditsLVItem,
                                          r'''$.original_name''',
                                        ).toString(),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'ver todos >',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 220.0,
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: TMDBReviewsCall.call(
                              movieId: widget.moveId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final listViewTMDBReviewsResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final reviewsLV = getJsonField(
                                    listViewTMDBReviewsResponse.jsonBody,
                                    r'''$.results''',
                                  ).toList().take(3).toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: reviewsLV.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 8.0),
                                    itemBuilder: (context, reviewsLVIndex) {
                                      final reviewsLVItem =
                                          reviewsLV[reviewsLVIndex];
                                      return ReviewCardWidget(
                                        key: Key(
                                            'Keytoy_${reviewsLVIndex}_of_${reviewsLV.length}'),
                                        image:
                                            'https://media.themoviedb.org/t/p/w45_and_h45_face${getJsonField(
                                          reviewsLVItem,
                                          r'''$.author_details.avatar_path''',
                                        ).toString()}',
                                        name: getJsonField(
                                          reviewsLVItem,
                                          r'''$.author''',
                                        ).toString(),
                                        review: getJsonField(
                                          reviewsLVItem,
                                          r'''$.content''',
                                        ).toString(),
                                        rating: 5.0,
                                        duration: '1h atrás',
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          'Similar',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 0.0, 36.0),
                        child: Container(
                          width: double.infinity,
                          height: 224.0,
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: TMDBSimilarCall.call(
                              movieId: widget.moveId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final listViewTMDBSimilarResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final similar = getJsonField(
                                    listViewTMDBSimilarResponse.jsonBody,
                                    r'''$.results''',
                                  ).toList().take(6).toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: similar.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 16.0),
                                    itemBuilder: (context, similarIndex) {
                                      final similarItem = similar[similarIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'movieDetails',
                                            queryParameters: {
                                              'moveId': serializeParam(
                                                getJsonField(
                                                  similarItem,
                                                  r'''$.id''',
                                                ),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: MovieCardWidget(
                                          key: Key(
                                              'Key699_${similarIndex}_of_${similar.length}'),
                                          image:
                                              'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${getJsonField(
                                            similarItem,
                                            r'''$.poster_path''',
                                          ).toString()}',
                                          title: getJsonField(
                                            similarItem,
                                            r'''$.title''',
                                          ).toString(),
                                          duration: '1h 37m',
                                          rating: getJsonField(
                                            similarItem,
                                            r'''$.vote_average''',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
