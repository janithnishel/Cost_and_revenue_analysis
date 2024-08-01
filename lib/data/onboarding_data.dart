import 'package:expenses/models/onbording_model.dart';

class OnboardingData {
  static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: "Gain total control \nof your money",
      description: "Become your own money manager \nand make every cent count",
      imagePath: "assets/images/onboard_1.png",
    ),
    OnboardingModel(
      title: "Know where your \nmoney goes",
      description:
          "Track your transaction easily,\nwith categories and financial report ",
      imagePath: "assets/images/onboard_3.png",
    ),
    OnboardingModel(
      title: "Planning ahead",
      description: "Setup your budget for each category \nso you in control",
      imagePath: "assets/images/onboard_2.png",
    )
  ];
}
