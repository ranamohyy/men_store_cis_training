import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:men_store_cis_training/core/helpers/app_colors.dart';
import 'package:men_store_cis_training/core/helpers/app_text_styles.dart';
class AppButtom extends StatelessWidget {
   AppButtom({super.key,required this.onPressed, this.text,this.widget});
  void Function()? onPressed;
  String ?text;
  Widget?widget;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor: AppColors.primaryColor,
        ) ,
        onPressed: onPressed,
        child:widget?? Text(text??"",style: AppTextStyles.kTextStyle14MediumWhite,))

    ;
  }
}
