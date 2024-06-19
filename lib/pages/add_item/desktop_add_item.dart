import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant.dart' as c;
import 'package:todo_app/pages/add_item/add_item_controller.dart';
import 'package:todo_app/pages/add_item/widgets/collaboration_widget.dart';
import 'package:todo_app/pages/add_item/widgets/priority_row.dart';
import 'package:todo_app/pages/add_item/widgets/tap_calendar.dart';
import 'package:todo_app/pages/add_item/widgets/tap_time.dart';
import 'package:todo_app/pages/add_item/widgets/title_and_description_fields.dart';
import 'package:todo_app/utils.dart' as u;

import 'add_item_view.dart';

class DesktopAddITemView extends GetView<AddItemController> {
  const DesktopAddITemView({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * .8;
    double h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        u.hFill(5),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          width: w * .5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    u.hFill(20),
                    u.TextWithDmSans(
                      text: "Create New Task",
                      fontSize: 18,
                      weight: FontWeight.w500,
                      color: c.purpleTheme,
                    ),
                  ],
                ),
              ),
              getSizedBox(w * .45, "Title", TitleField(controller: controller)),
              u.vFill(10),
              getSizedBox(
                w * .45,
                "Description",
                DescriptionField(
                  controller: controller,
                ),
              ),
              u.vFill(10),
              getSizedBox(
                w * .45,
                "Collab-with",
                CollaborationWidget(
                  w: w * .45,
                  controller: controller,
                ),
              ),
              u.vFill(10),
              getSizedBox(
                w * .45,
                "Date",
                TapCalendar(
                  controller: controller,
                  h: h,
                  w: w,
                ),
              ),
              u.vFill(10),
              getSizedBox(
                w * .45,
                "Priority",
                PriorityRow(
                  controller: controller,
                ),
              ),
              u.vFill(20),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          backgroundColor: c.purpleTheme),
                      onPressed: () {
                        controller.storeDataToDb();
                      },
                      child: const u.TextWithDmSans(
                        text: "Create",
                        color: Colors.white,
                        fontSize: 16,
                        weight: FontWeight.w500,
                      ))
                ],
              ),
              u.vFill(15)
            ],
          ),
        ),
      ],
    );
  }
}

getSizedBox(double w, String title, Widget child) {
  return SizedBox(
    width: w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [getHeading(title), child],
    ),
  );
}

getAddItemSingleRow(Widget w1, Widget w2) {
  return Row(
    children: [
      const Spacer(),
      w1,
      const Spacer(
        flex: 2,
      ),
      w2,
      const Spacer()
    ],
  );
}
