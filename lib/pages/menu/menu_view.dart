import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/pages/menu/menu_controller.dart';
import 'package:todo_app/utils.dart' as u;
import '../../constant.dart';

class SideMenu extends GetView<SideMenuController> {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Color(0xff4e4dac),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            u.vFill(20),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 30,
                );
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.menuTitles.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: index == controller.selectedPage.value
                          ? BorderRadius.circular(10)
                          : null,
                      color: index == controller.selectedPage.value
                          ? Colors.white
                          : null),
                  child: Row(
                    children: [
                      // u.hFill(5),
                      Icon(
                        controller.icons[index],
                        color: index == controller.selectedPage.value
                            ? Color(0xff4e4dac)
                            : Colors.white,
                        // size: 35,
                      ),
                      // u.hFill(5),
                      Spacer(),
                      u.TextWithDmSans(
                        text: controller.menuTitles[index],
                        color: index == controller.selectedPage.value
                            ? Color(0xff4e4dac)
                            : Colors.white,
                        //  index == controller.selectedPage.value
                        //     ? Colors.white
                        //     : violet,
                      ),
                      // u.hFill(5),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}