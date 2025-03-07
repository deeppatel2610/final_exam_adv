import 'package:final_exam_adv/controller/helper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            dbHelperController.readDatabase();
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: TextField(
          controller: txt,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                dbHelperController.abc(search: txt.text);
              },
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: dbHelperController.contactDbList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(dbHelperController.contactDbList[index].name!),
              ),
            );
          },
        ),
      ),
    );
  }
}
