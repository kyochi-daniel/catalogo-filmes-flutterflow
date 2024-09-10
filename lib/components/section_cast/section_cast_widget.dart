import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'section_cast_model.dart';
export 'section_cast_model.dart';

class SectionCastWidget extends StatefulWidget {
  const SectionCastWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<SectionCastWidget> createState() => _SectionCastWidgetState();
}

class _SectionCastWidgetState extends State<SectionCastWidget> {
  late SectionCastModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionCastModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          valueOrDefault<String>(
            widget.title,
            'Título',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          'ver todos >',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
