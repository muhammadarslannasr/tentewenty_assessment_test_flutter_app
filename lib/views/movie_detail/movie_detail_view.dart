import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_assessmen_test/data/response/status.dart';
import 'package:tentwenty_assessmen_test/models/movies_detail_model.dart';
import 'package:tentwenty_assessmen_test/models/movies_list.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';
import 'package:tentwenty_assessmen_test/utils/app_config.dart';
import 'package:tentwenty_assessmen_test/utils/constants.dart';
import 'package:tentwenty_assessmen_test/utils/ui_reponsive.dart';
import 'package:tentwenty_assessmen_test/utils/utils.dart';
import 'package:tentwenty_assessmen_test/view_model/watch_view_model.dart';
import 'package:tentwenty_assessmen_test/widgets/button_widget.dart';
import 'package:tentwenty_assessmen_test/widgets/text_widget.dart';

class MovieDetailView extends StatelessWidget {
  final Results result;

  const MovieDetailView({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () => context.read<WatchViewModel>().getMovieDetailById(
            movieId: result.id!,
          ),
    );
    return Scaffold(
      body: ChangeNotifierProvider<WatchViewModel>.value(
        value: context.read<WatchViewModel>(),
        child: Consumer<WatchViewModel>(
          builder: (context, value, _) {
            switch (value.movieDetail.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                return Utils.errorBody(
                  message: value.movies.message,
                );
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: UiResponsive.getWidth(context: context),
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.5)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0, 0.2, 0.8, 1],
                              ),
                            ),
                            child: Image.network(
                              AppConfig.imageURL +
                                  value.movieDetail.data!.posterPath!,
                            ),
                          ),
                          Positioned(
                            left: 8,
                            top: 8,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.selectedBottomTabColor,
                                  ),
                                ),
                                const TextWidget(
                                    title: Constants.watchTxt,
                                    color: AppColors.selectedBottomTabColor)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextWidget(
                                  title:
                                      '${Constants.inTheatersTxt} ${value.movieDetail.data!.releaseDate}',
                                  color: AppColors.selectedBottomTabColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ButtonWidget(
                                    title: Constants.getTicketsTxt,
                                    width: UiResponsive.getWidth(
                                            context: context) *
                                        0.5,
                                    height: UiResponsive.getHeight(
                                            context: context) *
                                        0.06,
                                    color: AppColors
                                        .getTicketsBackgroundColorButton,
                                    textColor: AppColors.selectedBottomTabColor,
                                    radius: 10,
                                    onPress: () {},
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ButtonWidget(
                                    title: Constants.getTicketsTxt,
                                    width: UiResponsive.getWidth(
                                            context: context) *
                                        0.5,
                                    height: UiResponsive.getHeight(
                                            context: context) *
                                        0.06,
                                    color: Colors.transparent,
                                    textColor: AppColors.selectedBottomTabColor,
                                    radius: 10,
                                    borderColor: AppColors
                                        .getTicketsBackgroundColorButton,
                                    onPress: () {},
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              title: Constants.genresTxt,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: UiResponsive.getHeight(context: context) *
                                  0.01,
                            ),
                            value.movieDetail.data!.genres!.isEmpty
                                ? const SizedBox()
                                : SizedBox(
                                    width:
                                        UiResponsive.getWidth(context: context),
                                    height: 24,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value
                                          .movieDetail.data!.genres!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Genres genres = value
                                            .movieDetail.data!.genres![index];
                                        return Container(
                                          width: 60,
                                          height: 24,
                                          margin:
                                              const EdgeInsets.only(left: 6),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .getTicketsBackgroundColorButton,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: TextWidget(
                                            title: genres.name ??= '',
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            SizedBox(
                              height: UiResponsive.getHeight(context: context) *
                                  0.02,
                            ),
                            Utils.horizontalDivider(),
                            SizedBox(
                              height: UiResponsive.getHeight(context: context) *
                                  0.02,
                            ),
                            const TextWidget(
                              title: Constants.overviewTxt,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: UiResponsive.getHeight(context: context) *
                                  0.010,
                            ),
                            TextWidget(
                              title: value.movieDetail.data!.overview ??= '',
                              color: AppColors.descriptionTextColor,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
