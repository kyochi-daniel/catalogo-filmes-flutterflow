import '/components/big_movie_card/big_movie_card_widget.dart';
import '/components/section_cast/section_cast_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movie_details_widget.dart' show MovieDetailsWidget;
import 'package:flutter/material.dart';

class MovieDetailsModel extends FlutterFlowModel<MovieDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BigMovieCard component.
  late BigMovieCardModel bigMovieCardModel;
  // Model for SectionCast.
  late SectionCastModel sectionCastModel;

  @override
  void initState(BuildContext context) {
    bigMovieCardModel = createModel(context, () => BigMovieCardModel());
    sectionCastModel = createModel(context, () => SectionCastModel());
  }

  @override
  void dispose() {
    bigMovieCardModel.dispose();
    sectionCastModel.dispose();
  }
}
