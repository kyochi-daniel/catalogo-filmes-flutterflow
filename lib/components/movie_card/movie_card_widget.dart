import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'movie_card_model.dart';
export 'movie_card_model.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.duration,
    required this.rating,
  });

  final String? image;
  final String? title;
  final String? duration;
  final double? rating;

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  late MovieCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.0,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.image!,
              width: double.infinity,
              height: 172.0,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  'Título',
                ),
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.duration,
                    'Duração',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                ),
                const Spacer(),
                Icon(
                  Icons.star,
                  color: FlutterFlowTheme.of(context).warning,
                  size: 16.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.rating?.toString(),
                    'Avaliação',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
          ),
        ],
      ),
    );
  }
}
