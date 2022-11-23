import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:new_project/controller/sites_controller.dart';
import 'package:new_project/modal/site_modal.dart';
import 'package:sizer/sizer.dart';

class CustomGridViewSitesList extends StatelessWidget {
 // final List<Hits>? res;
  final SitesController sitesController;

  CustomGridViewSitesList({
   // required this.res,
    required this.sitesController,
  });

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    int number=0;
    return LazyLoadScrollView(
        isLoading: false,
        onEndOfPage: () {
          number++;
          sitesController.loadMoreData(number);
        },
        child: GetBuilder<SitesController>(
            builder: (sitesController) => GridView.builder(
              controller: scrollController,
              shrinkWrap: true,
              physics:
              const AlwaysScrollableScrollPhysics(),
              itemCount:
              sitesController.res?.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.sp,
                mainAxisSpacing: 1.sp,
                childAspectRatio: .60.sp,
              ),
              itemBuilder: (BuildContext context,
                  int index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(sitesController
                                .res![
                            index]
                                .images![
                            0]
                                .imageUrl ==
                                '' ||
                                sitesController
                                    .res![
                                index]
                                    .images![
                                0]
                                    .imageUrl ==
                                    null
                                ? 'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'
                                : sitesController
                                .res![index]
                                .images![0]
                                .imageUrl
                                .toString()),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      height: 11.5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.all(2.sp),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Text(
                              sitesController
                                  .res![index]
                                  .name
                                  .toString(),
                              maxLines: 1,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                fontWeight:
                                FontWeight
                                    .w600,
                                fontSize: 13.sp,
                                color: Colors
                                    .grey[900],
                              ),
                            ),
                            Text(
                              sitesController
                                  .res![index]
                                  .description
                                  .toString(),
                              maxLines: 1,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors
                                    .grey[600],
                              ),
                            ),
                            Text(
                              sitesController
                                  .res![index]
                                  .location![0]
                                  .address
                                  .toString(),
                              maxLines: 1,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors
                                    .grey[600],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons
                                      .mic_outlined,
                                  color: Colors
                                      .grey[800],
                                  size: 18.sp,
                                ),
                                Text(
                                  ' +1',
                                  maxLines: 1,
                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                  style:
                                  TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                    fontSize:
                                    12.sp,
                                    color: Colors
                                        .grey[
                                    900],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )));
  }
}
