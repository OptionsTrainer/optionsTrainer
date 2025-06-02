import 'package:flutter/material.dart';

extension MaterialWidgetStates on Set<WidgetState> {
  bool get isPressed => contains(WidgetState.pressed);

  bool get isDisabled => contains(WidgetState.disabled);
}
