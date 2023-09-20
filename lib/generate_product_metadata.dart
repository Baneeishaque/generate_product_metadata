import 'dart:convert';
import 'dart:io';

import 'package:generate_product_metadata/ProductJsonModal.dart';
import 'package:path/path.dart';

int calculate() {
  return 6 * 7;
}

void printDirectoryContents({String operation = "Check"}) {
  final rootFolder = Directory(r'C:\Users\SMM\Downloads\Images');
  final List<FileSystemEntity> rootFolderContents =
      rootFolder.listSync().toList();
  // entities.forEach(print);

  for (final categoryFolder in rootFolderContents) {
    // print("Category : ${categoryFolder.path}");
    if ((FileSystemEntity.typeSync(categoryFolder.path)) ==
        FileSystemEntityType.directory) {
      final List<FileSystemEntity> categoryFolderContents =
          (Directory(categoryFolder.path)).listSync().toList();
      for (var productFolder in categoryFolderContents) {
        // print("Product : ${productFolder.path}");
        final List<FileSystemEntity> productFolderContents =
            (Directory(productFolder.path)).listSync().toList();
        if (operation == "Check") {
          if (FileSystemEntity.typeSync(
                  "${productFolder.path}\\product.json") ==
              FileSystemEntityType.notFound) {
            print(
                "\"${basename(categoryFolder.path)}\\${basename(productFolder.path)}\" Doesn't Contain product.json");
          }else{
            ProductJsonModal.fromJson(jsonDecode(File("${productFolder.path}\\product.json").readAsStringSync()));
          }
          if (FileSystemEntity.typeSync("${productFolder.path}\\images") ==
              FileSystemEntityType.notFound) {
            print(
                "\"${basename(categoryFolder.path)}\\${basename(productFolder.path)}\" Doesn't Contain images folder");
          } else {
            if (((Directory("${productFolder.path}\\images"))
                        .listSync()
                        .toList())
                    .length >
                3) {
              print(
                  "\"${basename(categoryFolder.path)}\\${basename(productFolder.path)}\\images\" Contains more than 3 files");
            }
          }
        } else {
          for (var productFolderContent in productFolderContents) {
            if ((FileSystemEntity.typeSync(productFolderContent.path)) ==
                FileSystemEntityType.directory) {
              for (var image in ((Directory(productFolderContent.path))
                  .listSync()
                  .toList())) {
                print("Product Image: ${image.path}");
              }
            } else {
              print("Product JSON : ${productFolderContent.path}");
            }
          }
        }
      }
    } else {
      print("Invalid Structure");
    }
  }
}
