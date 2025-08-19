String getYoutubeThumbnail(String youtubeUrl) {
  try {
    Uri uri = Uri.parse(youtubeUrl);
    String? videoId = uri.queryParameters['v'];

    if (videoId == null || videoId.isEmpty) {
      // Trường hợp link không hợp lệ
      return "https://img.youtube.com/vi/AjWfY7SnMBI/hqdefault.jpg";
    }

    // Trả về link thumbnail chất lượng cao (có thể đổi sang hqdefault.jpg)
    return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
    
  } catch (e) {
    // Nếu parse URL bị lỗi
    return "https://img.youtube.com/vi/AjWfY7SnMBI/hqdefault.jpg";
  }
}
