// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:chat_app/core/helper/app_pop_up.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/widgets/custom_btn.dart';
import 'package:chat_app/core/widgets/custom_text_btn.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(color: Colors.blueAccent),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),

                Text(
                  "Scholar Chat",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(flex: 2),
                Row(
                  children: [
                    Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  lableText: "Email",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  lableText: "Password",
                ),
                const SizedBox(height: 10),
                CustomBtn(
                  text: "Register",
                  onPressed: () async {
                    if (formKey.currentState?.validate() == false) return;
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      UserCredential user = await register();
                      AppPopUp.showSnackBar(
                        context,
                        "Registered Successfully,\nWelcome ${user.user!.displayName}",
                        color: Colors.green,
                      );
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        AppPopUp.showSnackBar(
                          context,
                          'The password provided is too weak.',
                        );
                      } else if (e.code == 'email-already-in-use') {
                        AppPopUp.showSnackBar(
                          context,
                          'The account already exists for that email.',
                        );
                      } else {
                        AppPopUp.showSnackBar(context, 'Error: ${e.message}');
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                CustomTextBtn(
                  text: "Already have an account ? ",
                  word: "Login",
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> register() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
