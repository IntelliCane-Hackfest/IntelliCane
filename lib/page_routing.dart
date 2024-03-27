import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellicane/login_page/screens/login_screen.dart';
import 'package:intellicane/main_page/screen/page.dart';
import 'models/application_state.dart';

bool isAuth = false;

class WidgetStateController extends ConsumerStatefulWidget {
  const WidgetStateController({Key? key}) : super(key: key);
  final WidgetBinder currentWidget = const WidgetBinder();

  @override
  ConsumerState<WidgetStateController> createState() =>
      _WidgetStateController();
}

class _WidgetStateController extends ConsumerState<WidgetStateController> {
  late Widget screen;

  @override
  void initState() {
    super.initState();
    // Start with the login page
    screen = widget.currentWidget.fetchStateWidget(ApplicationState.loginPage);
  }

  @override
  Widget build(BuildContext context) {
    // Auth Process
    final successAuthCondition = ref.watch(finishLoginProvider);
    if (successAuthCondition) {
      screen = widget.currentWidget.fetchStateWidget(ApplicationState.homePage);
      isRegistered = true;
    }

    // Success Auth
    if (isRegistered) {
      int pageSelected = ref.watch(selectedButton);
      if (pageSelected == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget.currentWidget
                    .fetchStateWidgetWithIndex(pageSelected)));
      } else if (pageSelected == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget.currentWidget
                    .fetchStateWidgetWithIndex(pageSelected)));
      }
    }
    return screen;
  }
}
