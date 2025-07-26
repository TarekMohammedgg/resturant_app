import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/utils/app_router.dart';
import 'package:resturant_app/core/utils/app_style.dart';
import 'package:resturant_app/services/firebase_services.dart';
import 'package:resturant_app/widgets/custom_text_button.dart';
import 'package:resturant_app/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController registerEmailController = TextEditingController();

  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerUserNameController =
      TextEditingController();
  bool isLoading = false;
  FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> registerFormKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go(AppRouter.kLoginScreen),
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
        ),
        centerTitle: true,
        title: Text("Sign Up", style: AppStyle.styleBold18),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: registerFormKey,
            child: Column(
              children: [
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: registerUserNameController,
                        hintText: "Name",
                      ),
                      SizedBox(height: 12),

                      CustomTextFormField(
                        controller: registerEmailController,
                        hintText: "Email",
                      ),
                      SizedBox(height: 12),
                      CustomTextFormField(
                        controller: registerPasswordController,
                        hintText: "Password",
                      ),

                      CustomTextButton(
                        widgt: isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: AppStyle.stylebold16,
                              ),
                        onPressed: () async {
                          try {
                            setState(() {
                              isLoading = true;
                            });

                            await firebaseServices
                                .firebaseAuthenticationRegister(
                                  registerEmailController,
                                  registerPasswordController,
                                );

                            setState(() {
                              isLoading = false;
                            });
                            if (context.mounted) {
                              context.go(AppRouter.kLoginScreen);
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                'The account already exists for that email.',
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
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
