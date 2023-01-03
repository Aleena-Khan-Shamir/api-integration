import 'package:get/get.dart';
import 'package:practice2/services/remote_service.dart';

import '../models/user.dart';

class UserController extends GetxController {
  final userData = <User>[].obs;
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    var users = await RemoterServices.fetchUser();
    if (users != null) {
      userData.value = users;
    }
  }
}
