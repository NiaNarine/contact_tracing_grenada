import 'package:contact_tracing_grenada/screens/screen.four.dart';
import 'package:contact_tracing_grenada/screens/screen.one.dart';
import 'package:contact_tracing_grenada/screens/screen.three.dart';
import 'package:contact_tracing_grenada/screens/screen.two.dart';
import 'package:contact_tracing_grenada/services/page.count.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _pageIndex = useProvider(pageCount);
    final _pageController = usePageController(initialPage: 0);
    void onPageChange(int index) => _pageIndex.changePages(index);

    return PageView(
      controller: _pageController,
      onPageChanged: onPageChange,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ScreenOne(pageController: _pageController),
        ScreenTwo(pageController: _pageController),
        ScreenThree(pageController: _pageController),
        ScreenFour(pageController: _pageController),
      ],
    );
  }
}
