import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_assessmen_test/data/response/status.dart';
import 'package:tentwenty_assessmen_test/models/movies_list.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';
import 'package:tentwenty_assessmen_test/utils/constants.dart';
import 'package:tentwenty_assessmen_test/utils/utils.dart';
import 'package:tentwenty_assessmen_test/view_model/watch_view_model.dart';
import 'package:tentwenty_assessmen_test/views/search_movies/search_view.dart';
import 'package:tentwenty_assessmen_test/views/watch/widget/movies_list_item_widget.dart';

class WatchView extends StatelessWidget {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero, () => context.read<WatchViewModel>().getMovies());
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.selectedBottomTabColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Constants.watchTxt,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SearchView()),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
          ),
        ),
        ChangeNotifierProvider<WatchViewModel>.value(
          value: context.read<WatchViewModel>(),
          child: Consumer<WatchViewModel>(
            builder: (context, value, _) {
              switch (value.movies.status) {
                case Status.LOADING:
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case Status.ERROR:
                  return Utils.errorBody(
                    message: value.movies.message,
                  );
                case Status.COMPLETED:
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.movies.data!.results!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Results result = value.movies.data!.results![index];
                        return MoviesListItemWidget(result: result);
                      },
                    ),
                  );
                default:
                  return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
