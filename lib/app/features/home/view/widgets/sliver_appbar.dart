import 'package:film_app/app/core/app_colors/app_colors.dart';
import 'package:film_app/app/core/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'textform_field.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      toolbarHeight: 80.h,
      backgroundColor: AppColors.kPrimary,

      automaticallyImplyLeading: false,
      // expandedHeight: 80.h,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: CircleAvatar(
          radius: 18.w,
          backgroundImage: const NetworkImage(
              "https://www.freepnglogos.com/uploads/hotstar-logo-png/hotstar-logo-photo-24.jpg"),
        ),
      ),
      title: SizedBox(
        width: 250.w,
        height: 35.h,
        child: const TextformsField(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(AppImages.profile),
            radius: 23.w,
          ),
        )
      ],
    );
  }
}
