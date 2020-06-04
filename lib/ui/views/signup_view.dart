import 'package:flutterapps/ui/shared/ui_helpers.dart';
import 'package:flutterapps/ui/widgets/busy_button.dart';
import 'package:flutterapps/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutterapps/viewmodels/signup_view_model.dart';
import 'package:flutterapps/ui/widgets/expansion_list.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 38,
                      ),
                    ),
                    verticalSpaceLarge,
                    // TODO: Add additional user data here to save (episode 2)
                    InputField(
                      placeholder: 'Full Name',
                      controller: fullNameController,
                    ),
                    verticalSpaceSmall,
                    InputField(
                      placeholder: 'Email',
                      controller: emailController,
                    ),
                    verticalSpaceSmall,
                    InputField(
                      placeholder: 'Password',
                      password: true,
                      controller: passwordController,
                      additionalNote: 'Password has to be a minimum of 6 characters.',
                    ),
                    verticalSpaceSmall,
                    ExpansionList<String>(
                        items: ['Admin', 'User'],
                        title: model.selectedRole,
                        onItemSelected: (item) => model.setSelectedRole(item)),
                    verticalSpaceMedium,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BusyButton(
                          title: 'Sign Up',
                          busy: model.busy,
                          onPressed: () {
                            // TODO: Perform firebase login here
                            model.signUp(email:emailController.text,password: passwordController.text,fullName: fullNameController.text);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
