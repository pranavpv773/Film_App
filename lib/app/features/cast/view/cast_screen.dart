import 'package:animate_do/animate_do.dart';
import 'package:film_app/app/core/app_colors/app_colors.dart';
import 'package:film_app/app/core/app_textstyles/app_textstyles.dart';
import 'package:film_app/app/features/cast/view_model/cast_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'shimmer_cast.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return context.watch<CastNotifier>().castList.isEmpty
        ? const ShimmerBuilderWidget()
        : Consumer<CastNotifier>(builder: (context, val, _) {
            return SizedBox(
              width: width,
              height: height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: val.castList.length,
                  itemBuilder: (context, index) {
                    return FadeInUpBig(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          shadowColor: AppColors.kPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 120,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppColors.kSecondary,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      val.castList[index].person!.image
                                          .toString()
                                          .toString(),
                                    ),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      val.castList[index].person!.name
                                          .toString(),
                                      style: AppTextStyles.h3.copyWith(
                                          color: AppColors.kGrey,
                                          letterSpacing: 1,
                                          wordSpacing: 1.5,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      val.castList[index].character!.name !=
                                              null
                                          ? val.castList[index].character!.name
                                              .toString()
                                          : "No Character",
                                      style: AppTextStyles.h3.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColors.kGrey,
                                          fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 120,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 108, 234, 113),
                                      ),
                                      child: Center(
                                        child: Text(
                                          val.castList[index].person!.gender !=
                                                  null
                                              ? val.castList[index].person!
                                                  .gender
                                                  .toString()
                                              : "No Gender",
                                          style: AppTextStyles.h3.copyWith(
                                              color: const Color.fromARGB(
                                                255,
                                                95,
                                                130,
                                                97,
                                              ),
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Total Stars: ${val.castList[index].self.toString()}⭐",
                                      style: AppTextStyles.h3.copyWith(
                                          color: AppColors.kGrey, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "👁️${val.castList[index].person!.birthday!.toString().substring(2)}k",
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kGrey,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            DateFormat('dd-MM-yyyy')
                                                .format(val.castList[index]
                                                    .person!.deathday)
                                                .toString(),
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kGrey,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            val.castList[index].voice != null
                                                ? val.castList[index].voice
                                                    .toString()
                                                    .substring(14)
                                                : "No voice",
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kGrey,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          });
  }
}
