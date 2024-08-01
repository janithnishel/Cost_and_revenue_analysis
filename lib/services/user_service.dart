import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<bool> storeUserDetails(String username, String email,
      String password, String confirmPassword, BuildContext context) async {
    bool isStored = true;
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Passwords are not matched!!",
            ),
          ),
        );
        return !isStored;
      } else {
        SharedPreferences sharedPre = await SharedPreferences.getInstance();

        await sharedPre.setString('username', username);
        await sharedPre.setString('email', email);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Data succesfully stored!",
            ),
          ),
        );
        return isStored;
      }
    } catch (eroor) {
      eroor.toString();
    }
    return isStored;
  }

  static Future<bool> getUserDetails() async {
    final getdata = await SharedPreferences.getInstance();

    String? username = getdata.getString('username');

    return username != null;
  }
}
