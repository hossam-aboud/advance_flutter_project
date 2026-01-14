import 'package:advance_flutter_project/core/helpers/spacing.dart';
import 'package:advance_flutter_project/core/theming/styles.dart';
import 'package:advance_flutter_project/core/widgets/app_text_button.dart';
import 'package:advance_flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'hi there my name is hossam how are you today, fine thanks you and you!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: _isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObsecureText = !_isObsecureText;
                            });
                          },
                          child: Icon(
                            _isObsecureText
                                ? Icons.visibility_off
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                          ),),
                      verticalSpace(40),
                      
                      AppTextButton(buttonText: 'Login', onPressed: (){},
                      textStyle: TextStyles.font16WhiteSemiBold,
                      ),

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
