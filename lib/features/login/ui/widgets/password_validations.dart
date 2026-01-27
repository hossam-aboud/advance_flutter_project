

   import 'package:advance_flutter_project/core/helpers/spacing.dart';
import 'package:advance_flutter_project/core/theming/colors.dart';
import 'package:advance_flutter_project/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidations({super.key, required this.hasUppercase, required this.hasLowercase, required this.hasNumber, required this.hasSpecialCharacter, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         _buildValidationsRow ('At least 1 lowercase letter' , hasLowercase),
        verticalSpace(2),
         _buildValidationsRow ('At least 1 uppercase letter' , hasUppercase),
        verticalSpace(2),
         _buildValidationsRow ('At least 1 special letter' , hasSpecialCharacter),
        verticalSpace(2),
         _buildValidationsRow ('At least 1 number letter' , hasNumber),
        verticalSpace(2),
         _buildValidationsRow ('At least 8 character long' , hasMinLength),

      ],
    );
  }

  Widget _buildValidationsRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5 ,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(text,
        style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null ,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color:  hasValidated ? ColorsManager.gray :  ColorsManager.darkBlue
        ),
        ),
      ],
    );
  }
}