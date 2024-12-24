import 'package:get/get.dart';

class LocationController extends GetxController {
  //! this basicly for showing the location but just the country and the administrativeArea only 
  var selectedAddress = "Not Set".obs;

  // Method to update the address
  void updateLocation(String supaddress) {
    selectedAddress.value = supaddress;
  }

  // Method to fetch the current location (optional utility)
  String getCurrentLocation() {
    return selectedAddress.value;
  }
}