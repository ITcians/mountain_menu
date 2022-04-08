
import 'package:flutter/cupertino.dart';

class Positions{
  Tween<Offset> topButton(){
    return Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: const Offset(0.0, -0.1),
    );
  }

  Tween<Offset> halfLeft(){
    return Tween<Offset>(
      begin: const Offset(1, 0.0),
      end: const Offset(0.4, -0.2),
    );
  }
  Tween<Offset> left(){
    return Tween<Offset>(
      begin: const Offset(1, 0.0),
      end: const Offset(0.1, -0.2),
    );
  }
  Tween<Offset> halfRight(){
    return Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(-0.4, -0.2),
    );
  }Tween<Offset> right(){
    return Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(-0.1, -0.2),
    );
  }
}