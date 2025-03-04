import 'package:final_exam_adv/helper/db_helper.dart';
import 'package:final_exam_adv/model/contact%20_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

var dbHelperController = Get.put(HelperController());

class HelperController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DbHelper.dbHelper.database;
    readDatabase();
  }

  RxList<ContactModel> contactDbList = <ContactModel>[].obs;
  String radioValue = '';
  RxBool isFavorite = false.obs;
  var txtName = TextEditingController();
  var txtNumber = TextEditingController();
  var txtEmail = TextEditingController();

  /// todo database logic
  Future<void> addDatabase({
    required String category,
    required String email,
    required int favorite,
    required String name,
    required int number,
  }) async {
    await DbHelper.dbHelper.intoDataBase(
      name,
      number,
      email,
      category,
      favorite,
    );
    readDatabase();
  }

  Future<void> updateData({
    required int id,
    required String category,
    required String email,
    required int favorite,
    required String name,
    required int number,
  }) async {
    ContactModel model = ContactModel(
      category: category,
      email: email,
      favorite: favorite,
      name: name,
      number: number,
    );
    await DbHelper.dbHelper.update(model);
    readDatabase();
  }

  Future<void> deleteDatabase({required int id}) async {
    await DbHelper.dbHelper.delete(id);
    readDatabase();
  }

  Future<void> readDatabase() async {
    List data = await DbHelper.dbHelper.readData();
    contactDbList.value = data.map((e) => ContactModel.fromMap(e)).toList();
  }

  /// todo ui code logic
  void radio({required var value}) {
    radioValue = value;
    update();
  }

  void favorite() {
    isFavorite.value = !isFavorite.value;
  }
}
