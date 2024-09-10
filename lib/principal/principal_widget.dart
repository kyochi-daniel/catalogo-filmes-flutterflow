import '/backend/api_requests/api_calls.dart';
import '/components/movie_card/movie_card_widget.dart';
import '/components/slider/slider_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'principal_model.dart';
export 'principal_model.dart';

class PrincipalWidget extends StatefulWidget {
  const PrincipalWidget({super.key});

  @override
  State<PrincipalWidget> createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget> {
  late PrincipalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrincipalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: TMDBPopularCall.call(),
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
                      final pageViewTMDBPopularResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final mostPopular = (TMDBPopularCall.mostPopular(
                                    pageViewTMDBPopularResponse.jsonBody,
                                  )?.toList() ??
                                  [])
                              .take(3)
                              .toList();

                          return SizedBox(
                            width: double.infinity,
                            height: 400.0,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(
                                                0,
                                                min(0,
                                                    mostPopular.length - 1))),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: mostPopular.length,
                                    itemBuilder: (context, mostPopularIndex) {
                                      final mostPopularItem =
                                          mostPopular[mostPopularIndex];
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
                                                  mostPopularItem,
                                                  r'''$.id''',
                                                ),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: SliderWidget(
                                          key: Key(
                                              'Key8cc_${mostPopularIndex}_of_${mostPopular.length}'),
                                          image:
                                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${getJsonField(
                                            mostPopularItem,
                                            r'''$.backdrop_path''',
                                          ).toString()}',
                                          title: valueOrDefault<String>(
                                            getJsonField(
                                              mostPopularItem,
                                              r'''$.title''',
                                            )?.toString(),
                                            'Título Filme',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 16.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(
                                                  0,
                                                  min(0,
                                                      mostPopular.length - 1))),
                                      count: mostPopular.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        safeSetState(() {});
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 2.0,
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 16.0,
                                        dotHeight: 6.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nos cinemas',
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
                        Text(
                          'ver todos >',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 224.0,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: TMDbAPICall.call(),
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
                          final lvNowPlayingTMDbAPIResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final moviesLV = (TMDbAPICall.nowPlayingResults(
                                        lvNowPlayingTMDbAPIResponse.jsonBody,
                                      )?.toList() ??
                                      [])
                                  .take(10)
                                  .toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: moviesLV.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 16.0),
                                itemBuilder: (context, moviesLVIndex) {
                                  final moviesLVItem = moviesLV[moviesLVIndex];
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
                                              moviesLVItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Keykkr_${moviesLVIndex}_of_${moviesLV.length}'),
                                      image:
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${getJsonField(
                                        moviesLVItem,
                                        r'''$.poster_path''',
                                      ).toString()}',
                                      title: getJsonField(
                                        moviesLVItem,
                                        r'''$.title''',
                                      ).toString(),
                                      duration: '1h 37m',
                                      rating: getJsonField(
                                        moviesLVItem,
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Séries populares',
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
                        Text(
                          'ver todos >',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 224.0,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: TmdbTvCall.call(),
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
                          final lvTvShowsTmdbTvResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final tvLV = (TmdbTvCall.mostPopularTv(
                                        lvTvShowsTmdbTvResponse.jsonBody,
                                      )?.toList() ??
                                      [])
                                  .take(10)
                                  .toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: tvLV.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 16.0),
                                itemBuilder: (context, tvLVIndex) {
                                  final tvLVItem = tvLV[tvLVIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'tvDetails',
                                        queryParameters: {
                                          'tvId': serializeParam(
                                            getJsonField(
                                              tvLVItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Keynme_${tvLVIndex}_of_${tvLV.length}'),
                                      image:
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${getJsonField(
                                        tvLVItem,
                                        r'''$.poster_path''',
                                      ).toString()}',
                                      title: getJsonField(
                                        tvLVItem,
                                        r'''$.name''',
                                      ).toString(),
                                      duration: '1h 37m',
                                      rating: getJsonField(
                                        tvLVItem,
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
                ].divide(const SizedBox(height: 8.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
