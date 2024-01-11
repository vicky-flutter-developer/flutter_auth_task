import 'package:flutter/material.dart';
import 'package:flutter_auth_task/screens/home_screen/controller/home_screen_controller.dart';
import 'package:flutter_auth_task/utils/app_colors/app_colors.dart';
import 'package:flutter_auth_task/utils/custom_widgets/custom_loader.dart';
import 'package:get/get.dart';

import '../../../utils/app_text_styles/app_text_styles.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "HUBINO",
            style: AppTextStyles.bold22
                .copyWith(color: AppColors.whiteColor, fontSize: 30),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title: Text('Alert'),
                        content: Text('Are you want to exit the app ?'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => controller.onLogoutClicked(),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.whiteColor,
                ))
          ],
          centerTitle: true,
        ),
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: controller.loginType.value == "email"
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customRow(
                                    title: "User email",
                                    value: controller.emailId.value),
                                const SizedBox(height: 15),
                                customRow(
                                    title: "Account created at",
                                    value: controller.convertToNormalDate(
                                        controller.accountCreationTime.value)),
                                const SizedBox(height: 15),
                                customRow(
                                    title: "Account login time",
                                    value: controller.convertToNormalDate(
                                        controller.loginTime.value)),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          controller.profileUrl.value),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                customRow(
                                    title: "User email",
                                    value: controller.emailId.value),
                                const SizedBox(height: 15),
                                customRow(
                                    title: "User name",
                                    value: controller.userName.value),
                                const SizedBox(height: 15),
                                customRow(
                                    title: "Account created at",
                                    value: controller.convertToNormalDate(
                                        controller.accountCreationTime.value)),
                                const SizedBox(height: 15),
                                customRow(
                                    title: "Account login time",
                                    value: controller.convertToNormalDate(
                                        controller.loginTime.value)),
                              ],
                            )),
                  if (controller.isLogoutLoading.value) const CustomLoader()
                ],
              ),
      ),
    );
  }

  Widget customRow({required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: Get.width * 0.44,
            child: Text(title, style: AppTextStyles.semiBold16)),
        const Text(":", style: AppTextStyles.semiBold16),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                constraints: BoxConstraints(maxWidth: Get.width * 0.7),
                child: Text(
                  value,
                  style: AppTextStyles.semiBold16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
        ),
      ],
    );
  }
}
