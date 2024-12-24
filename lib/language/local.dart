import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': english,
        "ar": arabic,
      };
}

const Map<String, String> english = {
  "Settings": "Settings",
  "' Location '": "' Location '",
  "Check Out": "Check Out",
  "Success": "Success",
  "added to the cart!": "added to the cart!",
  "Add to Cart": "Add to Cart",
  "Order History": "Order History",
  "Help Center": "Help Center",
  "Account Details": "Account Details",
  "Log out": "Log Out ",
  "Dark Mode": "Dark Mode",
  "Profile": "Profile",
  "Favorites": "Favorites",
  "Categories": "Categories",
  "Most popular": "Most popular",
  "Your Cart": "Your Cart",
  "Your cart is empty !": "Your cart is empty !",
  "Food": "Food",
  "Search": "Search",
  "Gifts": "Gifts",
  "Women": "Women",
  "Kids": "Kids",
  "User Name": "User Name",
  "Change language": "Change language",
  "Whats you're looking for?": "Whats you're looking for?",
  "Save": "Save",
  "Cancel": "Cancel",
  "Light Mode": "Light Mode",
  "Total:": "Total :",
  "Clothes": "Clothes",
  "What are you looking for?": "What are you looking for?",
  "Change Location Automatically": "Change Location Automatically",
  "Change Location Manualy": "Change Location Manualy",
  " Enter Location": "Enter Location ",
  "Grant Current Location": "Grant Current Location",
  "this let us show nearby stores": "this let us show nearby stores",
  "and you can order form ": "and you can order form ",
  "Use Current Location ": "Use Current Location ",
  "Enter manually": "Enter manually",
  "You are all set Up ": "You are all set Up ",
  "  You're Offline :(": "  You're Offline :(",
  "Please Make Sure You're Connected To The Internet":
      "Please Make Sure You're Connected To The Internet",
  //
  "Let Us Know Where You Are": "Let Us Know Where You Are",
  "No address available": "No address available",
  "Error fetching address": "Error fetching address",
  "Selected Location": "Selected Location",
  "Back": "Back",
  "Set Location": "Set Location",
  "Where are you ?": "Where are you ?",
  "Address:": "Address:",
  "Done": "Done",
  "Notifications": "Notifications",
    "Auto":"Auto",
      "Manually":"Manually",

};

const Map<String, String> arabic = {
  "Settings": "اعدادات",
  "Manually":"يدوي",
  "Auto":"تلقائي",
  "Where are you ?":"اين انت ؟",
  "Success": "تم بنجاح",
  "Check Out": "شراء",
  "added to the cart": "اضيف/ت الى سلة مشنرياتك !",
  "Add to Cart": "اضافة للسلة",
  "Order History": "تاريخ الطلبات ",
  "' Location '": "الموقع",
  "Help Center": "مركز المساعدة",
  "Account Details": "اعدادات الحساب",
  "Log out": "تسجيل الخروج",
  "Dark Mode": "الوضع المظلم",
  "Profile": "الحساب الشخصي",
  "Favorites": "المفضلة",
  "Categories": "التصنيفات",
  "Most popular": " الاكثر رواجا",
  "Your Cart": "سلة مشترياتك ",
  "Your cart is empty !": "   اوميقاد سلتك فارغة !",
  "Search": "البحث",
  "Food ": "طعام",
  "Gifts": "هدايا",
  "Women": "نساء",
  "Kids": "اطفال",
  "User Name": "اسم المستخدم",
  "Whats you're looking for?": "ما الذي تبحث عنه ؟",
  "Change language": "تغيير اللغة",
  "Save": "حفظ",
  "Done": "تم",
  "Back": "الرجوع",
  "Cancel": "الغاء",
  "Light Mode": "الوضع الساطع",
  "Total:": " المجموع : ",
  "Clothes ": "ألبسة",
  "What are you looking for?": "على ماذا تبحث؟",
  "Change Location Automatically": "تغيير المكان تلقائيا",
  "Change Location Manualy": "تغيير المكان يدويا",
  "Where Quality and Efficiency Meet.": "حيث تجتمع الجودة و الكفاءة معا",
  "Number": "رقم",
  "Enter Number": " ادخل رقم",
  "Enter Password": "ادخل كلمة السر",
  "Log in": "تسجيل دخول",
  "Sign in": "تسجيل دخول",
  "Sign Up": "إنشاء حساب",
  "Don`t Have an Account?": "ليس لديك حساب؟",
  'Our Socials': "تواصل معنا",
  "Welcome !": "اهلا !",
  'Enter your info': "ادخل معلوماتك",
  "Name": "الاسم",
  "Password": "كلمة السر",
  "Next": "التالي",
  "Already have an account ?": "لديك حساب؟",
  "Devices ": "أجهزة",
  "Home ": "مفروشات",
  "Enter Your Card info": "ادخل معلومات بطاقتك",
  "Choose a Provider:": "اختر مزود للبطاقة:",
  "Card Number": "رقم البطاقة",
  "Confirm Purchase": "تأكيد عملية الشراء",
  "Success!": "تم بنجاح !",
  "Congratulations on Your Purchase,Enjoy!":
      "شكرا لك, نتمنى لك الاسمتمتاع بأغراضك!",
  "Notifications": "الاشعارات",
  "Already in": "موجود",
  "is already in Your cart!": "موجود في سلة مشترياتك !",
  "Stores": "المتاجر",
  "Location": "الموقع",
  "Enter": "ادخل",
  "back": "رجوع",
  "fav Page": "المفضلة",
  "Skip": "تخطي",
  " Enter Location": "ادخل موقعك ",
  "Grant Current Location": "الحصول على موقعك الحالي",
  "this let us show nearby stores": "هذا يمكننا من عرض المتاجر القريبة",
  "and you can order form ": "ويمكنك الطلب منها",
  "Use Current Location ": "استخدام موقعي الحالي",
  "Enter manually": "الادخال بشكل يدوي",
  "You are all set Up ": "انت جاهز !",
  "Enter Card info": "ادخل معلومات بطاقتك",
  "First Name": "الاسم الأول",
  "Last Name": "الاسم الأخير",
  "General": "الاعدادات العامة",
  "Account": "حساب",
  "Phone Number": "رقم الهاتف",
  "Enable Notifications": "تفعيل الإشعارات",
  "English": "عربي",
  "Language": "اللغة",
  "Let Us Know Where You Are": "دعنا نعرف اين انت ",
  //
  "  You're Offline :(": "انت غير متصل :(",
  "Please Make Sure You're Connected To The Internet":
      "تاكد من انك متصل بالانترنت ",
};
