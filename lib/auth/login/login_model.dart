import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfEmail widget.
  FocusNode? tfEmailFocusNode;
  TextEditingController? tfEmailTextController;
  String? Function(BuildContext, String?)? tfEmailTextControllerValidator;
  // State field(s) for tfSenha widget.
  FocusNode? tfSenhaFocusNode;
  TextEditingController? tfSenhaTextController;
  late bool tfSenhaVisibility;
  String? Function(BuildContext, String?)? tfSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tfSenhaVisibility = false;
  }

  @override
  void dispose() {
    tfEmailFocusNode?.dispose();
    tfEmailTextController?.dispose();

    tfSenhaFocusNode?.dispose();
    tfSenhaTextController?.dispose();
  }
}
