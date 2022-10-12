import 'package:drak_light/core/enum/view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  updateUI() {
    notifyListeners();
  }
}
