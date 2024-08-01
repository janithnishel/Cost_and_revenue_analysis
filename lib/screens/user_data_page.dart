import 'package:expenses/constant/colors.dart';
import 'package:expenses/screens/main_page.dart';
import 'package:expenses/services/user_service.dart';
import 'package:expenses/widget/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({super.key});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isChek = false;
  bool _isShowPasssword = false;
  bool _isShowConfirmPasword = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _paswordController.dispose();
    _confirmPasswordController.dispose();
    // TODO: implement dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(
                      fontSize: 30, color: kBlack, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter name";
                          }
                          return null;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: kGrey,
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter email";
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: kGrey,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Email",
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter pasword";
                          }
                          return null;
                        },
                        obscureText: !_isShowPasssword,
                        controller: _paswordController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: kGrey,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Password",
                          contentPadding: const EdgeInsets.all(10),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _isShowPasssword = !_isShowPasssword;
                                });
                              },
                              child: !_isShowPasssword
                                  ? const Icon(Icons.visibility_sharp,
                                      color: kGrey, size: 20)
                                  : const Icon(Icons.visibility_off_sharp,
                                      color: kGrey, size: 20)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter confirm pasword";
                          }
                          return null;
                        },
                        obscureText: !_isShowConfirmPasword,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: kGrey,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Confirm Password",
                          contentPadding: const EdgeInsets.all(10),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _isShowConfirmPasword =
                                      !_isShowConfirmPasword;
                                });
                              },
                              child: !_isShowConfirmPasword
                                  ? const Icon(
                                      Icons.visibility_sharp,
                                      color: kGrey,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.visibility_off_sharp,
                                      color: kGrey,
                                      size: 20,
                                    )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Remember Me for the next time",
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: const EdgeInsets.only(left: 10),
                        value: _isChek,
                        activeColor: kMainColor,
                        onChanged: (value) {
                          setState(
                            () {
                              _isChek = !_isChek;
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String email = _emailController.text;
                      String password = _paswordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      if (await UserService.storeUserDetails(
                          name, email, password, confirmPassword, context)) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MainPage();
                        }));
                      }
                    }
                  },
                  child: const CustomButton(
                    title: "Next",
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
