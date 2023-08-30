part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<MovieEntity> upcomingMovies;
  final RequestState upcomingState;
  final String upcomingMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.upcomingMovies = const [],
    this.upcomingState = RequestState.loading,
    this.upcomingMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MovieState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<MovieEntity>? upcomingMovies,
    RequestState? upcomingState,
    String? upcomingMessage,
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      upcomingState: upcomingState ?? this.upcomingState,
      upcomingMessage: upcomingMessage ?? this.upcomingMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        upcomingMovies,
        upcomingState,
        upcomingMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
