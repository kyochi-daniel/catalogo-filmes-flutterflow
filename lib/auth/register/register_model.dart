import '/flutter_flow/flutter_flow_util.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfNomeCompleto widget.
  FocusNode? tfNomeCompletoFocusNode;
  TextEditingController? tfNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      tfNomeCompletoTextControllerValidator;
  // State field(s) for tfEmail widget.
  FocusNode? tfEmailFocusNode;
  TextEditingController? tfEmailTextController;
  String? Function(BuildContext, String?)? tfEmailTextControllerValidator;
  // State field(s) for tfSenha widget.
  FocusNode? tfSenhaFocusNode;
  TextEditingController? tfSenhaTextController;
  late bool tfSenhaVisibility;
  String? Function(BuildContext, String?)? tfSenhaTextControllerValidator;
  // State field(s) for tfConfirmeSenha widget.
  FocusNode? tfConfirmeSenhaFocusNode;
  TextEditingController? tfConfirmeSenhaTextController;
  late bool tfConfirmeSenhaVisibility;
  String? Function(BuildContext, String?)?
      tfConfirmeSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tfSenhaVisibility = false;
    tfConfirmeSenhaVisibility = false;
  }

  @override
  void dispose() {
    tfNomeCompletoFocusNode?.dispose();
    tfNomeCompletoTextController?.dispose();

    tfEmailFocusNode?.dispose();
    tfEmailTextController?.dispose();

    tfSenhaFocusNode?.dispose();
    tfSenhaTextController?.dispose();

    tfConfirmeSenhaFocusNode?.dispose();
    tfConfirmeSenhaTextController?.dispose();
  }
}
