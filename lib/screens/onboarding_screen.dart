import 'package:expenses/constant/colors.dart';
import 'package:expenses/data/onboarding_data.dart';
import 'package:expenses/screens/onboarding/front_page.dart';
import 'package:expenses/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenses/screens/user_data_page.dart';
import 'package:expenses/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //tracking the currrent page
  bool isHasPage = false;

  //create instance of page controller
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      onPageChanged: (value) {
                        setState(
                          () {
                            isHasPage = value == 3;
                          },
                        );
                      },
                      controller: _controller,
                      children: [
                        const FrontPage(),
                        SharedOnboardingScreen(
                          imageUrl: OnboardingData.onboardingList[0].imagePath,
                          title: OnboardingData.onboardingList[0].title,
                          description:
                              OnboardingData.onboardingList[0].description,
                          width: 300,
                        ),
                        SharedOnboardingScreen(
                          imageUrl: OnboardingData.onboardingList[1].imagePath,
                          title: OnboardingData.onboardingList[1].title,
                          description:
                              OnboardingData.onboardingList[1].description,
                          width: 300,
                        ),
                        SharedOnboardingScreen(
                          imageUrl: OnboardingData.onboardingList[2].imagePath,
                          title: OnboardingData.onboardingList[2].title,
                          description:
                              OnboardingData.onboardingList[2].description,
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      alignment: const Alignment(0, 0.72),
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 4,
                        effect: WormEffect(
                          type: WormType.normal,
                          activeDotColor: kMainColor,
                          dotColor: kGrey.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 25,
                      child: !isHasPage
                          ? GestureDetector(
                              // checking the expected page
                              onTap: () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: const Duration(microseconds: 100),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: CustomButton(
                                title: isHasPage ? "Get Started" : "Next",
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserDataPage(),
                                  ),
                                );
                              },
                              child: CustomButton(
                                title: isHasPage ? "Get Started" : "Next",
                              ),
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
