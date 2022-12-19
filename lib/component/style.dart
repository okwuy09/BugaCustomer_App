import 'package:buga_customer/component/colors.dart';
import 'package:flutter/material.dart';

final style = TextStyle(
  fontSize: 16,
  color: AppColor.black.withOpacity(0.8),
);
final buttonCircularIndicator = SizedBox(
  height: 25,
  width: 25,
  child: CircularProgressIndicator(
    backgroundColor: AppColor.lightGrey.withOpacity(0.6),
    valueColor: AlwaysStoppedAnimation(AppColor.white),
    strokeWidth: 4.0,
  ),
);
