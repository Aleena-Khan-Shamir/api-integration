import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice2/controllers/user_controller.dart';
import 'package:practice2/models/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final UserController usercontroler = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ShopX',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.filter))
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: usercontroler.userData.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4),
                itemBuilder: (context, index) {
                  return Visibility(
                    replacement: const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 8,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "id: ${usercontroler.userData[index].id.toString()}"),
                            Text(usercontroler.userData[index].name),
                            Text(usercontroler.userData[index].username),
                            Text(usercontroler.userData[index].email),
                            Text(usercontroler.userData[index].address.city),
                            Text(usercontroler.userData[index].address.street),
                            Text(usercontroler.userData[index].address.suite),
                            Text(usercontroler.userData[index].address.geo.lat),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
