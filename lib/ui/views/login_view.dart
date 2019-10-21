import 'package:flutter/material.dart';
import 'package:provider_architecture/core/view_state.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/helpers/constants.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

import '../shared/app_colors.dart';
import '../widgets/login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(validationMessage: model.errorMessage, controller: controller),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        // Navigate to the home view
                        Navigator.pushNamed(context, Constants.Home);
                      }
                    })
          ],
        ),
      ),
    );
  }
}
