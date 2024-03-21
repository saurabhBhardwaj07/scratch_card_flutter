import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_card/bloc/home_bloc/home_bloc.dart';
import 'package:scratch_card/core/app_exports.dart';
import 'package:scratch_card/widgets/auto_pick_number.dart';
import 'package:scratch_card/widgets/scratch_card_item.dart';
import 'package:scratch_card/widgets/scratch_widget.dart';
import 'package:scratch_card/widgets/widgets.dart';

class ScratchHomeScreen extends StatefulWidget {
  const ScratchHomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(const HomeBlocState())..add(HomeBlocInitialEvent()),
      child: const ScratchHomeScreen(),
    );
  }

  @override
  State<ScratchHomeScreen> createState() => _ScratchHomeScreenState();
}

class _ScratchHomeScreenState extends State<ScratchHomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> scratchDialog(BuildContext ctx, int index) {
    return showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BlocProvider.value(
            value: BlocProvider.of<HomeBloc>(ctx),
            child: ScratchWidget(index: index),
          );
        });
  }

  Future<void> autoPickUpDialog(
    BuildContext ctx,
  ) {
    return showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BlocProvider.value(
            value: BlocProvider.of<HomeBloc>(ctx),
            child: const AutoPickNumber(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildDepthFrameZero(context),
              12.v.sbH,
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: BlocSelector<HomeBloc, HomeBlocState,
                      TextEditingController?>(
                    selector: (state) {
                      return state.searchController;
                    },
                    builder: (context, state) {
                      return CustomSearchView(
                        controller: state,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (v) => unFocusAndCallBack(() {
                          if (!_formKey.currentState!.validate()) return;
                          context
                              .read<HomeBloc>()
                              .add(HomeBlocLuckyNumberSubmit());
                        }),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lucky number will not be empty';
                          }
                          final number = int.tryParse(value);
                          if (number == null || number < 1 || number > 99) {
                            return 'Please enter a number between 1 and 99';
                          }
                          return null;
                        },
                        textInputType: TextInputType.number,
                        hintText: "Enter your lucky numbers",
                      );
                    },
                  ),
                ),
              ),
              24.v.sbH,
              _buildDepthFrameZero1(context),
              30.v.sbH,
              BlocSelector<HomeBloc, HomeBlocState, int?>(
                selector: (state) {
                  return state.luckyNumber;
                },
                builder: (context, state) {
                  return state == null
                      ? Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 25.h, top: 100.h, right: 25.h),
                            child: Column(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.eyeCloseSmile,
                                  height: 120.v,
                                ),
                                20.v.sbH,
                                Text(
                                  "Your card will be there, type your lucky number and get the list of Cards to Scratch",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your's Lucky Scratches",
                                    style: CustomTextStyles.titleMediumBold,
                                  ),
                                  20.v.sbH,
                                  Expanded(
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 198.v,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10.h,
                                        crossAxisSpacing: 10.h,
                                      ),
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: state,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () =>
                                              scratchDialog(context, index),
                                          child: ScratchCardItem(
                                            position: index,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  20.v.sbH
                                ],
                              ),
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameZero(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          40.v.sbH,
          Row(
            children: [
              Text(
                "Win Real Money",
                style: theme.textTheme.headlineMedium,
              ),
              const Spacer(),
              BlocSelector<HomeBloc, HomeBlocState, int>(
                selector: (state) {
                  return state.winPrize;
                },
                builder: (context, state) {
                  return TweenAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    tween: Tween<double>(begin: 0, end: state.toDouble()),
                    builder: (context, value, child) {
                      return Text(
                        "\u{20B9}${value.toInt()}",
                        style: theme.textTheme.headlineMedium
                            ?.copyWith(color: theme.colorScheme.primary),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDepthFrameZero1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
                text: "Submit",
                onPressed: () => unFocusAndCallBack(() {
                      if (!_formKey.currentState!.validate()) return;
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeBlocLuckyNumberSubmit());
                    })),
          ),
          20.h.sbW,
          Expanded(
            child: CustomButton(
              text: "AutoPick",
              onPressed: () => autoPickUpDialog(context),
              decoration: AppDecoration.fillDeepOrange.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              buttonTextStyle: CustomTextStyles.titleMediumBold_1,
            ),
          ),
        ],
      ),
    );
  }
}
