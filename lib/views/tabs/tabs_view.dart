import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_assessmen_test/view_model/tabs_view_model.dart';
import 'package:tentwenty_assessmen_test/widgets/bottom_navigation_bar_widget.dart';

class TabsView extends StatelessWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: IndexedStack(
            sizing: StackFit.expand,
            index: context.watch<TabsViewModel>().currentIndex,
            children: context.watch<TabsViewModel>().tabs,
          ),
        ),
      ),
    );
  }
}
