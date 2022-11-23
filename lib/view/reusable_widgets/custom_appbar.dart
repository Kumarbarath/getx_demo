import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFlexibleAppBar extends StatelessWidget {

  final String title;
  final Widget leading;

  const CustomFlexibleAppBar({super.key, required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 55.sp,
      centerTitle: true,
      backgroundColor: Colors.white,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.sp, left: 5.sp, right: 15.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey[800],
                  size: 16.sp,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.grey[900]),
                ),
                Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
