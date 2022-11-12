import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeBuilderWidget extends StatelessWidget {
  const ShimmerHomeBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300] as Color,
              highlightColor: const Color.fromRGBO(245, 245, 245, 1),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.w,
                  mainAxisExtent: 200.h,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20.h,
                  mainAxisSpacing: 20.w,
                ),
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 150.w,
                        height: 180.h,
                        color: Colors.red,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ],
                  ),
                ),
                itemCount: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
