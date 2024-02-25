
import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class PlatformName{
  Future<String> get platformName;
}

class PlatformNameImpl implements PlatformName{

  @override
  Future<String> get platformName async{

    if(Platform.isAndroid){
      return 'Android';
    }

    else if(Platform.isIOS){
      return 'IOS';
    }

    else if(kIsWeb){
      return 'Web';
    }
    return '';
  }
}