import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class SignInController extends GetxController {
  //TODO: Implement SignInController

  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  Map<String, dynamic> jsonData = {
    "phone": "0501231230",
    "password": "123456789",
    "company_id": "3",
  };

    String apiUrl = "https://nottr.app/api/auth/login";

    void sendPostRequest() async {
      try {
        // Define the URL
        String url = "https://nottr.app/api/auth/login";

        // Make the POST request
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "phone": phoneTextEditingController.text,
            "password": passwordTextEditingController.text,
            "company_id": "3",
          }),
        );

        // Check the status code of the response
        if (response.statusCode == 200) {
          // Request successful, print response body
          Get.off( const MyHomePage());

          print('Response body: ${response.body}');
        } else {
          // Request failed, print error message
          print('Failed to send POST request');
          print('Response body: ${response.body}');

          GetSnackBar(
            snackPosition: SnackPosition.TOP,
            title: 'حدث خطأ اثناء تسجيل الدخول',
          message: response.body,);

          showDialog(
            context: Get!.context as BuildContext,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('حدث خطأ اثناء تسجيل الدخول'),
                content: const Text('رقم هاتف او كلمة مرور خاطئه, الرجاء المحاولة مجدداّ'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );

        }
      } catch (e) {
        // Exception occurred, print error message
      }
    }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
      phoneTextEditingController.dispose();
      phoneTextEditingController.dispose();
    super.onClose();

  }

}
