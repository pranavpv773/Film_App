import 'package:film_app/app/core/app_colors/app_colors.dart';
import 'package:film_app/app/core/app_textstyles/app_textstyles.dart';
import 'package:film_app/app/core/routes/routes.dart';
import 'package:film_app/app/features/details/view/details_screen.dart';
import 'package:film_app/app/features/home/view_model/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'widgets copy/sliver_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeNotifier>().showsApiFunction();
    });

    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBarWidget(),
          ];
        },
        body: context.watch<HomeNotifier>().showsList.isEmpty
            ? const CircularProgressIndicator()
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
                    mainAxisExtent: 220.h,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: context.read<HomeNotifier>().showsList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final data = context.read<HomeNotifier>().showsList;
                    return GestureDetector(
                      onTap: () {
                        Routes.nextScreen(
                            screen: DetailScreen(
                                image: data[index].image!.original.toString(),
                                index: index));
                      },
                      child: Container(
                        width: 150.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150.w,
                              height: 155.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        data[index].image!.original.toString()),
                                    fit: BoxFit.cover),
                                color: AppColors.kWhite,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].name.toString(),
                                    style: AppTextStyles.h4.copyWith(
                                        fontSize: 16,
                                        color: AppColors.kPrimary),
                                  ),
                                  Text(
                                    data[index].language.toString(),
                                    style: AppTextStyles.h4.copyWith(
                                        fontSize: 16, color: AppColors.kGrey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
