import '/backend/backend.dart';
import '/components/mobilenav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dashbaord_widget.dart' show DashbaordWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashbaordModel extends FlutterFlowModel<DashbaordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for mobilenav component.
  late MobilenavModel mobilenavModel;

  @override
  void initState(BuildContext context) {
    mobilenavModel = createModel(context, () => MobilenavModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    mobilenavModel.dispose();
  }
}
