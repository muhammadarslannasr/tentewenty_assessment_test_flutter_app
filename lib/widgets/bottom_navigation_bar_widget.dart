import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';
import 'package:tentwenty_assessmen_test/utils/constants.dart';
import 'package:tentwenty_assessmen_test/view_model/tabs_view_model.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              30,
            ),
            topLeft: Radius.circular(
              30,
            )),
        boxShadow: [
          BoxShadow(
            color: AppColors.selectedBottomTabColor,
            spreadRadius: 0,
            blurRadius: 10,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Material(
          child: BottomNavigationBar(
            backgroundColor: AppColors.bottomBarColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.selectedBottomTabColor,
            unselectedItemColor: AppColors.unSelectedBottomTabColor,
            currentIndex: context.watch<TabsViewModel>().currentIndex,
            onTap: context.read<TabsViewModel>().updatePageIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: Constants.dashboardTxt,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: Constants.watchTxt,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_call),
                label: Constants.mediaLibraryTxt,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_vert_rounded),
                label: Constants.moreTxt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
