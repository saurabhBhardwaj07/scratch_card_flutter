import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_card/bloc/home_bloc/home_bloc.dart';
import 'package:scratch_card/core/app_exports.dart';
import 'package:scratcher/scratcher.dart';

class ScratchWidget extends StatefulWidget {
  final int index;
  const ScratchWidget({super.key, required this.index});

  @override
  State<ScratchWidget> createState() => _ScratchWidgetState();
}

class _ScratchWidgetState extends State<ScratchWidget> {
  int rewardAmount = 0;
  String assetPath = ImageConstant.mildSmile;

  @override
  void initState() {
    switch (widget.index % 4) {
      case 0:
        rewardAmount = 10;
        break;
      case 3:
        rewardAmount = 15;
        assetPath = ImageConstant.smileProfile;
        break;
      case 1:
        rewardAmount = 15;
        assetPath = ImageConstant.smileProfile;
        break;
      case 2:
        rewardAmount = 10;
        break;
    }
    super.initState();
  }

  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Container(
        padding: EdgeInsets.only(
            left: 50,
            right: 50,
            top: size.height * 0.26,
            bottom: size.width * 0.08),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "You Earned Money",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Scratcher(
                  color: theme.colorScheme.primary,
                  accuracy: ScratchAccuracy.low,
                  threshold: 30,
                  brushSize: 40,
                  onThreshold: () {
                    setState(() {
                      _opacity = 1;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: _opacity,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Text(
                            "Hurray! you won",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          10.v.sbH,
                          CustomImageView(
                            imagePath: assetPath,
                            height: 120.v,
                          ),
                          10.v.sbH,
                          Text(
                            "\u{20B9}$rewardAmount",
                            style: theme.textTheme.headlineMedium
                                ?.copyWith(color: theme.colorScheme.primary),
                          ),
                          10.sbH,
                          SizedBox(
                            width: 200,
                            child: CustomButton(
                              text: "Tab here to Claim",
                              rightIcon: const Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(Icons.card_giftcard),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                BlocProvider.of<HomeBloc>(context).add(
                                    HomeBlocClaimAmountEvent(
                                        amount: rewardAmount));
                              },
                              decoration: AppDecoration.fillDeepOrange.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder12,
                              ),
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumBold_1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
