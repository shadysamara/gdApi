class ApiConstant {
  static final String baseUrl = 'https://fakestoreapi.com/';
  static final String getAllProducts = 'products';
  static String getOneProduct(int productId) => 'products/$productId';
  static final String getAllCategories = 'products/categories';
  static String getCategoryProducts(String catName) =>
      'products/category/$catName';
}
