import 'package:api_app/controller/registercontroller.dart';
import 'package:api_app/screens/auth/widgets/inputtextfields.dart';
import 'package:api_app/screens/auth/widgets/submi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/logincontroller.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // RegisterationController registerationController =
  //     Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        'WELCOME',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: !isLogin.value ? Colors.white : Colors.amber,
                          onPressed: () {
                            isLogin.value = false;
                          },
                          child: Text('Register'),
                        ),
                        MaterialButton(
                          color: isLogin.value ? Colors.white : Colors.amber,
                          onPressed: () {
                            isLogin.value = true;
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    loginWidget()
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  // Widget registerWidget() {
  //   return Column(
  //     children: [
  //       InputTextFieldWidget(registerationController.nameController, 'name'),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       InputTextFieldWidget(
  //           registerationController.emailController, 'email address'),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       InputTextFieldWidget(
  //           registerationController.passwordController, 'password'),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       SubmitButton(
  //         onPressed: () => registerationController.registerWithEmail(),
  //         title: 'Register',
  //       )
  //     ],
  //   );
  // }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.userController, 'Username'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginl(),
          title: 'Login',
        )
      ],
    );
  }
}
