import 'package:flutter/material.dart';
import 'package:tentwenty_assessmen_test/models/movies_list.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';
import 'package:tentwenty_assessmen_test/utils/app_config.dart';
import 'package:tentwenty_assessmen_test/utils/ui_reponsive.dart';
import 'package:tentwenty_assessmen_test/views/movie_detail/movie_detail_view.dart';
import 'package:tentwenty_assessmen_test/widgets/text_widget.dart';

class MoviesListItemWidget extends StatelessWidget {
  final Results result;
  const MoviesListItemWidget({super.key,required this.result});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: UiResponsive.getWidth(context: context),
          height: UiResponsive.getHeight(context: context) *
              0.25,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  AppConfig.imageURL + result.posterPath!,
                  width: UiResponsive.getWidth(
                      context: context),
                  height: UiResponsive.getHeight(
                      context: context) *
                      0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextWidget(
                    title: result.title ??= '',
                    color:
                    AppColors.selectedBottomTabColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MovieDetailView(
              result: result,
            ),
          ),
        );
      },
    );
  }
}
