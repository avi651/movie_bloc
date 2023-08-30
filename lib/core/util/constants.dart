abstract class UrlBuilder {
  static const String BASE_URL = "https://api.themoviedb.org/3/movie";
  static const String API_KEY = "?api_key=15cc2d06189e5b776834afe0bdef40ba";

  static String buildUrl({required String endPoint}) =>
      "$BASE_URL$endPoint$API_KEY";

  static String buildAdvancedUrl(
          {required String movieId, required String endPoint}) =>
      "$BASE_URL$movieId$endPoint$API_KEY";
}

class ImageUrlBuilder {
  static const String BASE_URL = "https://image.tmdb.org/t/p/w500";

  static String buildUrl(String path) => "$BASE_URL$path";
}

class Api {
  static String getNowPlayingUrl() =>
      UrlBuilder.buildUrl(endPoint: "/now_playing");

  static String getTopRatedUrl() => UrlBuilder.buildUrl(endPoint: "/top_rated");

  static String getUpcomingUrl() => UrlBuilder.buildUrl(endPoint: "/upcoming");

  static String getImageUrl(String path) => ImageUrlBuilder.buildUrl(path);

  static String getDetailUrl(int movieId) =>
      UrlBuilder.buildUrl(endPoint: "/$movieId");

  static String getCreditsUrl(int movieId) =>
      UrlBuilder.buildAdvancedUrl(movieId: "/$movieId", endPoint: "/credits");

  static String getRecommendationUrl(int movieId) =>
      UrlBuilder.buildAdvancedUrl(
          movieId: "/$movieId", endPoint: "/recommendations");

  static String getTestUrl() => UrlBuilder.buildUrl(endPoint: "/868759");
}
