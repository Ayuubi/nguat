import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/login_page/login_page_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());
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
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CarouselSlider(
                items: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/WhatsApp_Image_2024-10-29_at_11.27.46_AM.jpeg',
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/DALLE_2024-10-31_09.09.35_-_A_high-quality_mobile_background_image_featuring_a_beautifully_decorated_cake_with_the_word_Nagaad_written_elegantly_on_it_in_frosting._Arranged_alo.webp',
                      width: double.infinity,
                      height: 571.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/DALLE_2024-10-31_09.13.03_-_A_high-quality_mobile_background_image_featuring_an_elegant_arrangement_of_fresh_cuts_of_meat_and_bottles_of_milk,_designed_for_a_luxurious_culinary-t.webp',
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                carouselController: _model.carouselController ??=
                    CarouselSliderController(),
                options: CarouselOptions(
                  initialPage: 1,
                  viewportFraction: 1.0,
                  disableCenter: true,
                  enlargeCenterPage: false,
                  enlargeFactor: 0.0,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  autoPlayInterval: Duration(milliseconds: (600 + 2000)),
                  autoPlayCurve: Curves.linear,
                  pauseAutoPlayInFiniteScroll: true,
                  onPageChanged: (index, _) =>
                      _model.carouselCurrentIndex = index,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x98FFFDFF), Color(0x00FFFDFF)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -0.83),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NAGAAD\n    COFFE',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Noto Sans JP',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPageWidget(),
                            ),
                          );
                        },
                        text: 'Skip',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 10.0, 16.0, 10.0),
                          iconAlignment: IconAlignment.end,
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).accent2,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
