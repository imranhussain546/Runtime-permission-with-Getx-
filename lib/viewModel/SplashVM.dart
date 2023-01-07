import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashVM extends GetxController{

  @override
  void onInit() {
    launchPage();
    super.onInit();
  }

  Future<void> launchPage() async {
    Future.delayed(const Duration(seconds: 2),
            () => {
      checkPermissions()
            });
  }

  void checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.storage,
    ].request();

    if(await Permission.location.request().isGranted &&
        await Permission.camera.request().isGranted &&
        await Permission.storage.request().isGranted){
      // _getCurrentLocation();
    }else{
      Get.snackbar("Permission declined","Please allow all the permissions to launch this application");
      /*GlobalEquipments.SnackToastFailed(,
          "Please allow all the permissions to launch this application");
      GlobalEquipments.MyLogs("status: permission not granted");
      Get.offAllNamed(RoutesGetters.getSplashRoute());*/
    }
  }
}