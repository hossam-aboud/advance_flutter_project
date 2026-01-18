import 'package:advance_flutter_project/core/helpers/spacing.dart';
import 'package:advance_flutter_project/core/theming/styles.dart';
import 'package:advance_flutter_project/core/widgets/app_text_button.dart';
import 'package:advance_flutter_project/core/widgets/app_text_form_field.dart';
import 'package:advance_flutter_project/features/login/data/models/login_request_body.dart';
import 'package:advance_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advance_flutter_project/features/login/ui/widgets/email_and_password.dart';
import 'package:advance_flutter_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),

                    AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        _validateThenDoLogin();
                      },
                      textStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    verticalSpace(16),
                    verticalSpace(60),

                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateThenDoLogin() {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
