import 'package:film_app/app/core/app_colors/app_colors.dart';
import 'package:film_app/app/core/app_textstyles/app_textstyles.dart';
import 'package:film_app/app/core/routes/routes.dart';
import 'package:film_app/app/features/home/view_model/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.image, required this.index})
      : super(key: key);
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kSecondary,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.kPrimary,
                      child: IconButton(
                        onPressed: () => Routes.backScreen(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.kSecondary,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.kPrimary,
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.kSecondary,
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomDetailsSheet(index),
          ],
        ),
      ),
    );
  }
}

Widget bottomDetailsSheet(int index1) {
  return DraggableScrollableSheet(
    initialChildSize: 0.5,
    minChildSize: 0.020,
    maxChildSize: .86,
    builder: (BuildContext context, ScrollController scrollController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(
                10,
              ),
            ),
            color: AppColors.kPrimary,
          ),
          child: ListView(
            controller: scrollController,
            children: [
              ListTile(
                title: Text(
                  "Name",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kGrey, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().showsList[index1].name != null
                      ? context
                          .read<HomeNotifier>()
                          .showsList[index1]
                          .name
                          .toString()
                          .toUpperCase()
                      : "No Name",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kGrey, letterSpacing: 1),
                ),
              ),
              ListTile(
                title: Text(
                  "Description",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kGrey, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().showsList[index1].summary != null
                      ? context
                          .read<HomeNotifier>()
                          .showsList[index1]
                          .summary
                          .toString()
                      : "No Description",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ExpansionTileWidget(
                index1: index1,
              ),
              ListTile(
                title: Text(
                  "Language",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kGrey, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().showsList[index1].language !=
                          null
                      ? context
                          .read<HomeNotifier>()
                          .showsList[index1]
                          .language
                          .toString()
                      : "No Language",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Film time",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kGrey, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().showsList[index1].runtime != null
                      ? "${context.read<HomeNotifier>().showsList[index1].runtime.toString()} min"
                      : "No hours",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Create at",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kGrey, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().showsList[index1].premiered !=
                          null
                      ? DateFormat('dd-MM-yyyy')
                          .format(context
                              .read<HomeNotifier>()
                              .showsList[index1]
                              .premiered!)
                          .toString()
                      : "No Date ",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.index1,
  }) : super(key: key);
  final int index1;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        backgroundColor: AppColors.kWhite,
        trailing: const Icon(Icons.add),
        title: Text(
          "The Film type",
          style: AppTextStyles.h2.copyWith(
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            color: AppColors.kGrey,
          ),
        ),
        children: [
          context.read<HomeNotifier>().showsList[index1].type!.isEmpty ||
                  context.read<HomeNotifier>().showsList[index1].type == null
              ? Text(
                  "No type",
                  style: AppTextStyles.h3,
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context
                        .read<HomeNotifier>()
                        .showsList[index1]
                        .type
                        .toString()
                        .toUpperCase(),
                    style: AppTextStyles.h3.copyWith(
                      fontSize: 12,
                      color: AppColors.kPrimary,
                    ),
                  )),
        ]);
  }
}
