class BaseFunc {
  static String convertPrice(int price) {
    String priceString = price.toString();
    String result = '';

    // Duyệt từ cuối chuỗi lên đầu, thêm dấu phẩy sau mỗi 3 ký tự
    for (int i = 0; i < priceString.length; i++) {
      result = priceString[priceString.length - 1 - i] + result;
      if ((i + 1) % 3 == 0 && i + 1 != priceString.length) {
        result = ',$result';
      }
    }

    return result;
  }
}
