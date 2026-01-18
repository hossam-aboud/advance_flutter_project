import 'package:advance_flutter_project/core/helpers/app_regex.dart';
import 'package:advance_flutter_project/core/helpers/spacing.dart';
import 'package:advance_flutter_project/core/widgets/app_text_form_field.dart';
import 'package:advance_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advance_flutter_project/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool _isObsecureText = true;
  late TextEditingController _passwordController;
  bool _hasUppercase = false;
  bool _hasLowercase = false;

  bool _hasNumber = false;

  bool _hasSpecialCharacter = false;

  bool _hasMinLength = false;

  @override
  void initState() {
    super.initState();
    _passwordController = context.read<LoginCubit>().passwordController;

    _setUpPasswordControllerListener();
  }

  void _setUpPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        _hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
        _hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
        _hasNumber = AppRegex.hasNumber(_passwordController.text);
        _hasSpecialCharacter = AppRegex.hasSpecialCharacter(_passwordController.text);
        _hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty  || !AppRegex.isEmailValid(value)) {
                return 'please enter a valid email';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              }
            },
            hintText: 'Password',
            isObscureText: _isObsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObsecureText = !_isObsecureText;
                });
              },
              child: Icon(
                _isObsecureText ? Icons.visibility_off : Icons.visibility_off,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
            hasUppercase: _hasUppercase,
            hasLowercase: _hasLowercase,
            hasNumber: _hasNumber,
            hasSpecialCharacter: _hasSpecialCharacter,
            hasMinLength: _hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
   _passwordController.dispose();
  }
}
