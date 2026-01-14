


  import 'package:advance_flutter_project/core/theming/colors.dart';
import 'package:advance_flutter_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
final EdgeInsetsGeometry? contentPadding;
final InputBorder? focusedBorder;
final InputBorder? enabledBorder;
final TextStyle? inputTextStyle;
final TextStyle? hintStyle;
final bool? isObscureText;
final Widget? suffixIcon;
final Widget? prefixIcon;
final String hintText;
final Color? backGroundColor;

  const AppTextFormField({super.key, this.contentPadding, this.focusedBorder, this.enabledBorder, this.inputTextStyle, this.hintStyle, this.isObscureText, this.suffixIcon, this.prefixIcon, required this.hintText, this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense:  true ,
        contentPadding: contentPadding ??  EdgeInsetsDirectional.symmetric(
          horizontal: 20.w ,
          vertical: 18.h
        ),
        focusedBorder: focusedBorder ??  OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3 ,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder:enabledBorder ?? OutlineInputBorder(
          borderSide:   BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3 ,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ??  TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true ,
        fillColor: backGroundColor ?? ColorsManager.moreLightGray
      ),
      obscureText: isObscureText ?? false  ,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}