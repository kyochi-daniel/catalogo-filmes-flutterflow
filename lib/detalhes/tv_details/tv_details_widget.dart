import '/backend/api_requests/api_calls.dart';
import '/components/big_tv_card/big_tv_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tv_details_model.dart';
export 'tv_details_model.dart';

class TvDetailsWidget extends StatefulWidget {
  const TvDetailsWidget({
    super.key,
    required this.tvId,
  });

  final int? tvId;

  @override
  State<TvDetailsWidget> createState() => _TvDetailsWidgetState();
}

class _TvDetailsWidgetState extends State<TvDetailsWidget> {
  late TvDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TvDetailsModel());

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
      future: TMDBTvDetailsCall.call(
        tvId: widget.tvId,
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
        final tvDetailsTMDBTvDetailsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.bigTvCardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BigTvCardWidget(
                          image:
                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.backdrop_path''',
                          ).toString()}',
                          title: getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.name''',
                          ).toString(),
                          lastAirEpisode: 'Last Episode S${getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.season_number''',
                          ).toString()}E${getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.episode_number''',
                          ).toString()}',
                          genres: getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.genres[0:2]..name''',
                          ).toString(),
                          numOfSeasons: getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.number_of_seasons''',
                          ),
                          rating: getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.vote_average''',
                          ),
                          numOfVotes: getJsonField(
                            tvDetailsTMDBTvDetailsResponse.jsonBody,
                            r'''$.vote_count''',
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
