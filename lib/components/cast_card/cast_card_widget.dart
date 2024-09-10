import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'cast_card_model.dart';
export 'cast_card_model.dart';

class CastCardWidget extends StatefulWidget {
  const CastCardWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String? image;
  final String? name;

  @override
  State<CastCardWidget> createState() => _CastCardWidgetState();
}

class _CastCardWidgetState extends State<CastCardWidget> {
  late CastCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CastCardModel());

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
      width: 90.0,
      height: 200.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.image!,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text(
              valueOrDefault<String>(
                widget.name,
                'Nome',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
