import '/components/big_tv_card/big_tv_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tv_details_widget.dart' show TvDetailsWidget;
import 'package:flutter/material.dart';

class TvDetailsModel extends FlutterFlowModel<TvDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BigTvCard component.
  late BigTvCardModel bigTvCardModel;

  @override
  void initState(BuildContext context) {
    bigTvCardModel = createModel(context, () => BigTvCardModel());
  }

  @override
  void dispose() {
    bigTvCardModel.dispose();
  }
}
