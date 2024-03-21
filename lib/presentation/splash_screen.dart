import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scratch_card/core/app_exports.dart';
import 'package:scratch_card/presentation/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: ScratchHomeScreen.builder(context),
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 600),
              type: PageTransitionType.rightToLeft));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgDepth4Frame0,
                      height: 218.v,
                      width: 390.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
                    child: Column(
                      children: [
                        Text("Start winning rewards for free",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineSmall),
                        9.v.sbH,
                        Text(
                            "Enter your lucky number get a chance of wining rewards.",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  22.v.sbH,
                  const Spacer(),
                  WaveSpinnerLoader(
                    color: Colors.black,
                    duration: const Duration(milliseconds: 1400),
                    trackColor: theme.colorScheme.primary,
                    waveColor: theme.colorScheme.primary,
                    size: 80.h,
                  ),
                  const Spacer()
                ]))));
  }
}
