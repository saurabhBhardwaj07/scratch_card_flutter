// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scratch_card/core/app_exports.dart';
import 'package:scratch_card/core/data/scratch_data_list.dart';
import 'package:scratch_card/model/scratch_card_list_model.dart';

// ignore: must_be_immutable
class ScratchCardItem extends StatelessWidget {
  final int position;
  const ScratchCardItem({
    Key? key,
    required this.position,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    // Generate a random index between 0 and 3 (inclusive)
    final int randomIndex = random.nextInt(4);
    // Access the randomly selected item from scratchListData
    final ScratchCardListItem item = scratchListData[randomIndex];

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: item.imagePath,
              height: 141.adaptSize,
              width: 141.adaptSize,
              radius: BorderRadius.circular(
                70.h,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
              child: Text(
                " Tab here to\nScratch",
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 12.fSize,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        8.v.sbH,
        Text(
          item.desc!,
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
