import 'package:flutter/cupertino.dart';
import 'package:tentwenty_assessmen_test/views/dashboard/dashboard_view.dart';
import 'package:tentwenty_assessmen_test/views/media/media_library_view.dart';
import 'package:tentwenty_assessmen_test/views/more/more_view.dart';
import 'package:tentwenty_assessmen_test/views/tabs/custom_tab_view.dart';
import 'package:tentwenty_assessmen_test/views/watch/watch_view.dart';

class TabsViewModel with ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  int _currentIndex = 0;

  bool _animateToTop = false;

  int get currentIndex => _currentIndex;

  bool get animateTop => _animateToTop;

  final List<CustomTabView> _tabs = [
    CustomTabView(
      child: const DashboardView(),
    ),
    CustomTabView(
      child: const WatchView(),
    ),
    CustomTabView(
      child: const MediaLibraryView(),
    ),
    CustomTabView(
      child: const MoreView(),
    ),
  ];

  List<CustomTabView> get tabs => _tabs;

  setPageIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  setAnimateToTop(bool value) {
    _animateToTop = value;
    notifyListeners();
  }

  updatePageIndex(int pageIndex) {
    setPageIndex(pageIndex);
    if (_currentIndex == 0) {
      if (_animateToTop) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      } else {
        setAnimateToTop(true);
      }
    } else {
      setAnimateToTop(false);
    }
  }
}
