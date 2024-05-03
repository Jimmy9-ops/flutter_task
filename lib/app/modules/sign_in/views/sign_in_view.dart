import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/branches_map/controllers/branches_map_controller.dart';
import 'package:flutter_task/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import '../../branches_products/controllers/branches_products_controller.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
   SignInView({Key? key}) : super(key: key);

  final c = Get.find<SignInController>();
   final m =  Get.lazyPut(()=>BranchesMapController());
  // final h = Get.lazyPut(()=>HomeController());
   final f =  Get.lazyPut(()=>BranchesProductsController());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor:  Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('تسجيل الدخول',style: TextStyle(color: Colors.white),),
              const SizedBox(width: 30,),
              InkWell(child: const Icon(Icons.arrow_circle_right_outlined,color: Colors.white,),
              onTap: (){
              //  Get.to(MyHomePage());
               // Get.to();
                Get.to(() =>  const MyHomePage());
              },),

            ],
          ),
          centerTitle: true,
        ),
        body:  Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
            ),
            child:  Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              // textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('لنقم بتسجيل الدخول'),
                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 300,
                  child: TextField(
                    //textAlign: TextAlign.end,
                    controller: c.phoneTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      // hintTextDirection: TextDirection.rtl,
                        labelStyle: TextStyle(fontSize: 14.0),
                        labelText: 'رقم الجوال',
                        hintStyle:
                        TextStyle(color: Colors.black, fontSize: 10.0)),
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 300,
                  child: TextField(
                    //textAlign: TextAlign.end,
                    controller: c.passwordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 14.0),
                        labelText: 'كلمة المرور',
                        hintStyle:
                        TextStyle(color: Colors.black, fontSize: 10.0)),
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),


                    GestureDetector(
                      onTap: () {
                        // Implement Forgot Password functionality
                      },
                      child: const Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    // Implement Sign In functionality
                    c.sendPostRequest();
                  },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  child: const Text('تسجيل الدخول',style: TextStyle(color: Colors.white),),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    GestureDetector(
                      onTap: () {
                        // Implement Forgot Password functionality
                      },
                      child: const Text(
                        'تسجيل جديد',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      );



  }
}
