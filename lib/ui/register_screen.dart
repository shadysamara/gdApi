import 'package:flutter/material.dart';
import 'package:gd_api/providers/api_provider.dart';
import 'package:gd_api/ui/widgets/custom_button.dart';
import 'package:gd_api/ui/widgets/custom_testfield.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Consumer<ApiProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Form(
              key: registerFormKey,
              child: Column(
                children: [
                  CustomTextfield(
                    validation: provider.validateEmail,
                    controller: provider.email,
                    label: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomTextfield(
                    validation: provider.validateNull,
                    controller: provider.password,
                    label: 'Password',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  CustomTextfield(
                    validation: provider.validateConfirmedPassword,
                    controller: provider.password2,
                    label: 'Retype Password',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  CustomTextfield(
                    validation: provider.validateNull,
                    controller: provider.firstName,
                    label: 'First Name',
                    textInputType: TextInputType.text,
                  ),
                  CustomTextfield(
                    validation: provider.validateNull,
                    controller: provider.lastName,
                    label: 'Last Name',
                    textInputType: TextInputType.text,
                  ),
                  CustomTextfield(
                    validation: provider.validatePhone,
                    controller: provider.phone,
                    label: 'Phone',
                    textInputType: TextInputType.phone,
                  ),
                  CustomButton(
                    title: 'Register',
                    function: () {
                      // if (registerFormKey.currentState.validate()) {
                      //   provider.register(context);
                      // }
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
