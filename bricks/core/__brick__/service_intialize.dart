import 'package:../../services/service_locator.imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/theme/theme_enum.dart';

class ServiceInitialize {
  ServiceInitialize._();
  static Future<void> initialize() async {
    //! Initialize all services here
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await initDependencies();
    await Hive.initFlutter();
    await ScreenUtil.ensureScreenSize();

    Hive.registerAdapter(ThemeEnumAdapter());
    await Hive.openBox('app');
    // FirebaseMessaging.onBackgroundMessage(onAppBackground);
    // await NotificationHelper.instance.initialize();
    timeago.setLocaleMessages('en', timeago.EnMessages());
    timeago.setLocaleMessages('en_short', timeago.EnShortMessages());
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
  }
}
