class Endpoints {
  // base url
  static const String baseUrl = "https://newsapi.org/v2";
  static const String key = "07fbc5e6cdb143568c71a25e84ce63c3";

  static newsUrl() {
    return '$baseUrl/everything?q=bitcoin&apiKey=$key';
  }

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}