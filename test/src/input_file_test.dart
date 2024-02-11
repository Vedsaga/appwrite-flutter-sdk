import 'package:flutter_test/flutter_test.dart';
import 'package:appwrite/src/exception.dart';
import 'package:appwrite/src/input_file.dart';

void main() {
  group('InputFile', () {
    test('throws exception when path is not provided', () {
      expect(
        () => InputFile.fromPath(path: '/path/to/file'),
        throwsA(isA<AppwriteException>().having(
          (e) => e.message,
          'message',
          'Either `path` or `bytes` must be provided',
        )),
      );
    });

    test('throws exception when bytes are not provided', () {
      expect(
        () => InputFile.fromBytes(bytes: [1, 2, 3], filename: 'file.txt'),
        throwsA(isA<AppwriteException>().having(
          (e) => e.message,
          'message',
          'Either `path` or `bytes` must be provided',
        )),
      );
    });

    test('throws exception when neither path nor bytes are provided', () {
      expect(
        () => null,
        throwsA(isA<AppwriteException>().having(
          (e) => e.message,
          'message',
          'Either `path` or `bytes` must be provided',
        )),
      );
    });

    test('throws exception when both path and bytes are null', () {
      expect(
        () => null,
        throwsA(isA<AppwriteException>().having(
          (e) => e.message,
          'message',
          'Either `path` or `bytes` must be provided',
        )),
      );
    });
  });

  test('creates InputFile from path', () {
    final inputFile = InputFile.fromPath(path: '/path/to/file');

    expect(inputFile.path, '/path/to/file');
    expect(inputFile.filename, isNull);
    expect(inputFile.contentType, isNull);
    expect(inputFile.bytes, isNull);
  });

  test('creates InputFile from bytes', () {
    final inputFile =
        InputFile.fromBytes(bytes: [1, 2, 3], filename: 'file.txt');

    expect(inputFile.path, isNull);
    expect(inputFile.filename, 'file.txt');
    expect(inputFile.contentType, isNull);
    expect(inputFile.bytes, [1, 2, 3]);
  });
}
