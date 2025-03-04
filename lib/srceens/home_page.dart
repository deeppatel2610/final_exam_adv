import 'package:final_exam_adv/controller/helper_controller.dart';
import 'package:final_exam_adv/model/contact%20_model.dart';
import 'package:final_exam_adv/srceens/all_contact.dart';
import 'package:final_exam_adv/srceens/family.dart';
import 'package:final_exam_adv/srceens/friends.dart';
import 'package:final_exam_adv/srceens/work.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/fire.dart';
import 'favorite.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                for (
                  int i = 0;
                  i < dbHelperController.contactDbList.length;
                  i++
                ) {
                  ContactModel book = ContactModel(
                    category: dbHelperController.contactDbList[i].category,
                    email: dbHelperController.contactDbList[i].email,
                    favorite: dbHelperController.contactDbList[i].favorite,
                    name: dbHelperController.contactDbList[i].name,
                    number: dbHelperController.contactDbList[i].number,
                    id: dbHelperController.contactDbList[i].id,
                  );
                  Fire.fire.addDataFire(book);
                }
              },
              icon: const Icon(Icons.cloud),
            ),
            StreamBuilder(
              stream: Fire.fire.readDataFire(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List data = snapshot.data!.docs;
                  List<ContactModel> userData =
                      data.map((e) => ContactModel.fromMap(e.data())).toList();
                  return IconButton(
                    onPressed: () {
                      for (int i = 0; i <= userData.length; i++) {
                        dbHelperController.addDatabase(
                          category: userData[i].category!,
                          email: userData[i].email!,
                          favorite: userData[i].favorite!,
                          name: userData[i].name!,
                          number: userData[i].number!,
                        );
                      }
                    },
                    icon: const Icon(Icons.rotate_right_outlined),
                  );
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error_outline);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
          backgroundColor: Colors.blue,
          title: Text(
            "Contact App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Text(
                  "All Contact",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Family",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Friends',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Work",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Favorite',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [AllContact(), Family(), Friends(), Work(), Favorite()],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 40),
                              Text(
                                "Add Contact",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5,
                                  fontSize: 20,
                                ),
                              ),
                              Obx(
                                () => IconButton(
                                  onPressed: () {
                                    dbHelperController.favorite();
                                  },
                                  icon:
                                      (dbHelperController.isFavorite.value)
                                          ? Icon(Icons.favorite_border)
                                          : Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          inputBoxMethod(
                            text: "Name",
                            controller: dbHelperController.txtName,
                          ),
                          inputBoxMethod(
                            text: "Number",
                            controller: dbHelperController.txtNumber,
                          ),
                          inputBoxMethod(
                            text: "Email",
                            controller: dbHelperController.txtEmail,
                          ),
                          GetBuilder<HelperController>(
                            builder:
                                (controller) => RadioListTile(
                                  title: Text(
                                    "Family",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  value: "Family",
                                  groupValue: controller.radioValue,
                                  onChanged: (value) {
                                    controller.radio(value: value);
                                  },
                                ),
                          ),
                          GetBuilder<HelperController>(
                            builder:
                                (controller) => RadioListTile(
                                  title: Text(
                                    "Friends",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  value: "Friends",
                                  groupValue: controller.radioValue,
                                  onChanged: (value) {
                                    controller.radio(value: value);
                                  },
                                ),
                          ),
                          GetBuilder<HelperController>(
                            builder:
                                (controller) => RadioListTile(
                                  title: Text(
                                    "Work",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  value: "Work",
                                  groupValue: controller.radioValue,
                                  onChanged: (value) {
                                    controller.radio(value: value);
                                  },
                                ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await dbHelperController.addDatabase(
                                    category: dbHelperController.radioValue,
                                    email: dbHelperController.txtEmail.text,
                                    favorite:
                                        (dbHelperController.isFavorite.value)
                                            ? 0
                                            : 1,
                                    name: dbHelperController.txtName.text,
                                    number: int.parse(
                                      dbHelperController.txtNumber.text,
                                    ),
                                  );
                                  Navigator.of(context).pop();
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
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

Card inputBoxMethod({required String text, required var controller}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(border: InputBorder.none, hintText: text),
      ),
    ),
  );
}
