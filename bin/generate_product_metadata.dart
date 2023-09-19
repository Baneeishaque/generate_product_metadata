import 'package:generate_product_metadata/generate_product_metadata.dart'
    as generate_product_metadata;

Future<void> main(List<String> arguments) async {
  // print('Hello world: ${generate_product_metadata.calculate()}!');
  if (arguments.isEmpty) {
    generate_product_metadata.printDirectoryContents();
  }
}
