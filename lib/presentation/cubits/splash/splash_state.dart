import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final double progress;
  final bool isComplete;

  const SplashState({
    this.progress = 0.0,
    this.isComplete = false,
  });

  SplashState copyWith({
    double? progress,
    bool? isComplete,
  }) {
    return SplashState(
      progress: progress ?? this.progress,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  List<Object> get props => [progress, isComplete];
}
