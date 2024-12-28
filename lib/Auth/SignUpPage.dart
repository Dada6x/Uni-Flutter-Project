import 'dart:io';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mamamia_uniproject/Auth/Login_Page.dart';
import 'package:mamamia_uniproject/Location/setLocation.dart';
import 'package:mamamia_uniproject/components/Button.dart';
import 'package:mamamia_uniproject/components/normal_appbar.dart';
import 'package:mamamia_uniproject/Auth/model.dart';
import 'package:mamamia_uniproject/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignupPage> {
//-------------------------Controllers


  //---------------------------------------------------------
  Image? img;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Model>(
      builder: (controller) {
        return Scaffold(
          appBar: NormalAppBar('Enter your info'.tr),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //! image
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: controller.screenHeight(context) * 0.02,
                  ),
                  child: SizedBox(
                    width: 135,
                    height: 150,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const ImagePickingDialog();
                            });
                      },
                      child: Get.find<Model>().imageIspicked
                          ? CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              backgroundImage: Get.find<Model>().pickedImage,
                            )
                          : CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              child: const Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                //! first Name
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: controller.screenWidth(context) * 0.05),
                  child: SizedBox(
                    child: TextField(
                        decoration: inputDecoration(context,
                            hint: "First Name",
                            icon: const Icon(Icons.person_2_outlined))),
                  ),
                ),
                //! Last Name
                SizedBox(
                  height: controller.screenHeight(context) * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: controller.screenWidth(context) * 0.05),
                  child: SizedBox(
                    child: TextField(
                        decoration: inputDecoration(context,
                            hint: "Last Name",
                            icon: const Icon(Icons.account_box))),
                  ),
                ),
                SizedBox(
                  height: controller.screenHeight(context) * 0.03,
                ),
                //! phone Number
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: controller.screenWidth(context) * 0.05),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(context,
                          hint: "Number",
                          icon: const Icon(Icons.call_outlined))),
                ),
                SizedBox(
                  height: controller.screenHeight(context) * 0.03,
                ),
                //! Password
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: controller.screenWidth(context) * 0.05),
                  child: TextField(
                      decoration: inputDecoration(context,
                          hint: "Password", icon: const Icon(Icons.key))),
                ),
                SizedBox(
                  height: controller.screenHeight(context) * 0.03,
                ),
                SizedBox(
                  //!  to ward change this
                  height: Get.find<Model>().screenHeight(context) * 0.03,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: ProjectButton(
                    text: 'Next'.tr,
                    width: controller.screenWidth(context),
                    function: () {
                      Get.off(const SettingLocation());
                      sharedPref!.setString("id", "1");
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.off(const LoginPage());
                      },
                      child: Text(
                        "Log in".tr,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

InputDecoration inputDecoration(BuildContext context,
    {required String hint, required Icon icon}) {
  return InputDecoration(
    fillColor: Theme.of(context).colorScheme.secondary,
    filled: true,
    prefixIcon: icon,
    iconColor: Colors.grey,
    hintText: hint.tr,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
  );
}

class ImagePickingDialog extends StatefulWidget {
  const ImagePickingDialog({super.key});

  @override
  State<ImagePickingDialog> createState() => _ImagePickingDialogState();
}

class _ImagePickingDialogState extends State<ImagePickingDialog> {
  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    _selectedImage = File(returnedImage.path);
    giveselectedImage(_selectedImage!);
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;

    _selectedImage = File(returnedImage.path);
    giveselectedImage(_selectedImage!);
  }

  void giveselectedImage(File img) {
    Get.find<Model>().changeImage(img);
  }

  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Model(),
        builder: (controller) => Dialog(
              child: SizedBox(
                width: controller.screenWidth(context) * 0.5,
                height: controller.screenHeight(context) * 0.25,
                child: SimpleDialog(
                  contentPadding: const EdgeInsets.all(0),
                  children: [
                    ListTile(
                      iconColor: Theme.of(context).colorScheme.primary,
                      leading: const Icon(FontAwesomeIcons.image),
                      title: const Text("Gallery Image"),
                      onTap: pickImageFromGallery,
                    ),
                    ListTile(
                      iconColor: Theme.of(context).colorScheme.primary,
                      leading: const Icon(FontAwesomeIcons.camera),
                      title: const Text("Camera Image"),
                      onTap: pickImageFromCamera,
                    ),
                  ],
                ),
              ),
            ));
  }
}
