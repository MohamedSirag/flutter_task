import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());
  Timer? _timer;
  final Duration _duration = const Duration(seconds: 3);

  void startAnimation() {
    final startTime = DateTime.now().millisecondsSinceEpoch;

    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      final elapsed = DateTime.now().millisecondsSinceEpoch - startTime;
      final progress = elapsed / _duration.inMilliseconds;

      if (progress >= 1.0) {
        emit(state.copyWith(progress: 1.0, isComplete: true));
        _timer?.cancel();
      } else {
        emit(state.copyWith(progress: progress));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
