import 'package:flutter/material.dart';

import '../../../shared/index.dart';

class BuildCardStepKyc extends StatefulWidget {
  const BuildCardStepKyc({
    super.key,
    this.valueKycStep = 0,
    this.iconCard = Icons.person_pin_rounded,
  }) : assert(valueKycStep <= 1, 'valueKycStep not greater than 1');

  final double valueKycStep;
  final IconData? iconCard;

  @override
  State<BuildCardStepKyc> createState() => _BuildCardStepKycState();
}

class _BuildCardStepKycState extends State<BuildCardStepKyc> {
  late PageController _pageViewController;

  int _currentPageIndex = 0;

  ThemeData themeData() => Theme.of(context);

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return InkWell(
      onTap: () {
        _currentPageIndex = _currentPageIndex <= 1 ? _currentPageIndex + 1 : 0;

        _pageViewController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );

        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.18,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(100),
          ),
          color: Color(0xff20B176),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.12,
                    child: PageView(
                      controller: _pageViewController,
                      onPageChanged: _handlePageViewChanged,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal details',
                              style: themeData().textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                            const Text(
                              'All legal details as on your ID',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Take a selfie',
                              style: themeData().textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                            const Text(
                              'Verify your identity with '
                              'selfie',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More details',
                              style: themeData().textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                            const Text(
                              'Let us know more about you',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: DotIndicator(
                      dotCount: 3,
                      selectedIndex: _currentPageIndex,
                    ),
                  ),
                ],
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      // height: 150,
                      // width: 115,
                      width: screenWidth * 0.28,
                      height: screenHeight * 0.15,
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                        strokeWidth: 10,
                        backgroundColor: Colors.white30,
                        value: widget.valueKycStep,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Center(
                      child: Icon(
                        widget.iconCard,
                        color: Colors.white,
                        size: 36,
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

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}
