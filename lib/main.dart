import 'package:expenses/services/user_service.dart';
import 'package:expenses/services/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          bool data = snapshot.data??false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Expenses",
            theme: ThemeData(fontFamily: "Poppins"),
            home: Wrapper(isHasData: data),
          );
        }
      },
    );
  }
}
