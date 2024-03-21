import 'package:scratch_card/core/utils/image_constant.dart';

class ScratchCardListItem {
  ScratchCardListItem({
    this.imagePath,
    this.desc,
    this.price,
    this.id,
  }) {
    imagePath = imagePath ?? ImageConstant.imgDepth4Frame0141x141;
    desc = desc ?? "Lucky 7's";
    price = price ?? "10,000 jackpot";
    id = id ?? "";
  }

  String? imagePath;
  String? desc;
  String? price;
  String? id;
}
