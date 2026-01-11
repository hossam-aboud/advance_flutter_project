import 'package:advance_flutter_project/core/theming/styles.dart';
import 'package:advance_flutter_project/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:advance_flutter_project/features/onboarding/ui/widgets/doctor_image_and_text.dart';
import 'package:advance_flutter_project/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
              top: 30.h  ,
              bottom: 30.h ,
            ),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h,),
                const DoctorImageAndText (),
                Padding(
                  padding:  EdgeInsetsDirectional.symmetric(
                    horizontal: 30.w ,
                  ),
                  child: Column(
                    children: [
                      Text('Manage and scheduale all of your doctors appointments',
                        style: TextStyles.font13GrayRegular ,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        ),
                      SizedBox(height: 30.h,),
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}