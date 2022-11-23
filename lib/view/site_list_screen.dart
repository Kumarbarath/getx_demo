import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/sites_controller.dart';
import 'package:new_project/view/reusable_widgets/custom_appbar.dart';
import 'package:new_project/view/reusable_widgets/custom_display_continer.dart';
import 'package:sizer/sizer.dart';

class SiteListScreen extends StatelessWidget {
  const SiteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SitesController sitesController = Get.put(SitesController());
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
    ScrollController scrollController = ScrollController();

    int number = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.sp), // Set this height
          child: CustomFlexibleAppBar(
            title: 'SiteList',
            leading: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey[800],
              size: 16.sp,
            ),
          )),
      body: Obx(
        () => sitesController.isDataLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : sitesController.hasError.value == true
                ? const Center(child: Text('Something went wrong'))
                : sitesController.res?.isEmpty == true
                    ? const Center(child: Text('No data found'))
                    : RefreshIndicator(
                        key: _refreshIndicatorKey,
                        color: Colors.white,
                        backgroundColor: Colors.blue,
                        strokeWidth: 4.0,
                        onRefresh: () async {
                          sitesController.getData();
                          return Future<void>.delayed(
                              const Duration(seconds: 2));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.sp,
                            ),
                            Expanded(
                              child: CustomGridViewSitesList(
                                sitesController: sitesController,
                              ),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                          ],
                        ),
                      ),
      ),
    );
  }
}
