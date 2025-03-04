//
import 'package:final_exam_adv/controller/helper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => ListView.builder(
          itemCount: dbHelperController.contactDbList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child:
                  (dbHelperController.contactDbList[index].favorite == false)
                      ? ListTile(
                        title: Text(
                          dbHelperController.contactDbList[index].name
                              .toString(),
                        ),
                        subtitle: Text(
                          dbHelperController.contactDbList[index].email
                              .toString(),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => Container(
                                        height: 500,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade100,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(width: 40),
                                                  Text(
                                                    "Add Contact",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: .5,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => IconButton(
                                                      onPressed: () {
                                                        dbHelperController
                                                            .favorite();
                                                      },
                                                      icon:
                                                          (dbHelperController
                                                                  .isFavorite
                                                                  .value)
                                                              ? Icon(
                                                                Icons
                                                                    .favorite_border,
                                                              )
                                                              : Icon(
                                                                Icons.favorite,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              inputBoxMethod(
                                                text: "Name",
                                                controller:
                                                    dbHelperController.txtName,
                                              ),
                                              inputBoxMethod(
                                                text: "Number",
                                                controller:
                                                    dbHelperController
                                                        .txtNumber,
                                              ),
                                              inputBoxMethod(
                                                text: "Email",
                                                controller:
                                                    dbHelperController.txtEmail,
                                              ),
                                              GetBuilder<HelperController>(
                                                builder:
                                                    (
                                                      controller,
                                                    ) => RadioListTile(
                                                      title: Text(
                                                        "Family",
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      value: "Family",
                                                      groupValue:
                                                          controller.radioValue,
                                                      onChanged: (value) {
                                                        controller.radio(
                                                          value: value,
                                                        );
                                                      },
                                                    ),
                                              ),
                                              GetBuilder<HelperController>(
                                                builder:
                                                    (
                                                      controller,
                                                    ) => RadioListTile(
                                                      title: Text(
                                                        "Friends",
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      value: "Friends",
                                                      groupValue:
                                                          controller.radioValue,
                                                      onChanged: (value) {
                                                        controller.radio(
                                                          value: value,
                                                        );
                                                      },
                                                    ),
                                              ),
                                              GetBuilder<HelperController>(
                                                builder:
                                                    (
                                                      controller,
                                                    ) => RadioListTile(
                                                      title: Text(
                                                        "Work",
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      value: "Work",
                                                      groupValue:
                                                          controller.radioValue,
                                                      onChanged: (value) {
                                                        controller.radio(
                                                          value: value,
                                                        );
                                                      },
                                                    ),
                                              ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      dbHelperController.updateData(
                                                        id:
                                                            dbHelperController
                                                                .contactDbList[index]
                                                                .id!,
                                                        category:
                                                            dbHelperController
                                                                .radioValue,
                                                        email:
                                                            dbHelperController
                                                                .txtEmail
                                                                .text,
                                                        favorite:
                                                            (dbHelperController
                                                                    .isFavorite
                                                                    .value)
                                                                ? 0
                                                                : 1,
                                                        name:
                                                            dbHelperController
                                                                .txtName
                                                                .text,
                                                        number: int.parse(
                                                          dbHelperController
                                                              .txtNumber
                                                              .text,
                                                        ),
                                                      );
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    child: Text("Save"),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                dbHelperController.deleteDatabase(
                                  id:
                                      dbHelperController
                                          .contactDbList[index]
                                          .id!,
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      )
                      : null,
            );
          },
        ),
      ),
    );
  }
}
