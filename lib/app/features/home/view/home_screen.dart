import 'package:animate_do/animate_do.dart';
import 'package:film_app/app/core/app_colors/app_colors.dart';
import 'package:film_app/app/core/app_textstyles/app_textstyles.dart';
import 'package:film_app/app/core/routes/routes.dart';
import 'package:film_app/app/features/cast/view/cast_screen.dart';
import 'package:film_app/app/features/cast/view_model/cast_notifier.dart';
import 'package:film_app/app/features/details/view/details_screen.dart';
import 'package:film_app/app/features/home/view/widgets/shimmer_home.dart';
import 'package:film_app/app/features/home/view_model/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'widgets/sliver_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: WillPopScope(
        onWillPop: context.watch<HomeNotifier>().onWillPop,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBarWidget(),
            ];
          },
          body: context.watch<HomeNotifier>().showsList.isEmpty
              ? const ShimmerHomeBuilderWidget()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 250.h,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: context.read<HomeNotifier>().showsList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final data = context.read<HomeNotifier>().showsList;
                      return FadeInDownBig(
                        child: GestureDetector(
                          onTap: () {
                            Routes.nextScreen(
                                screen: DetailScreen(
                                    image:
                                        data[index].image!.original.toString(),
                                    index: index));
                          },
                          child: Container(
                            width: 150.w,
                            height: 260.h,
                            decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150.w,
                                  height: 155.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data[index]
                                            .image!
                                            .original
                                            .toString()),
                                        fit: BoxFit.cover),
                                    color: AppColors.kWhite,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: ListTile(
                                    leading: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].name.toString(),
                                          style: AppTextStyles.h4.copyWith(
                                            fontSize: 16.sp,
                                            color: AppColors.kPrimary,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          data[index].language.toString(),
                                          style: AppTextStyles.h4.copyWith(
                                            fontSize: 16.sp,
                                            color: AppColors.kGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.w,
                                      horizontal: 10.w,
                                    ),
                                    primary: AppColors.kSecondary,
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CastNotifier>()
                                        .castApiFunction(index + 1);
                                    Routes.nextScreen(
                                        screen: const CastScreen());
                                  },
                                  child: const Text('cast'),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

class HeadingDropWidget extends StatelessWidget {
  const HeadingDropWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "The best films in the world?",
            style: AppTextStyles.h1,
          ),
        ],
      ),
    );
  }
}
