import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_boot_frontend/presentation/movie_details/controllers/movie_details.controller.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  Get.put(MovieDetailsController());
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      
    );
  }
}
