import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:source_gen/source_gen.dart';

class ValidatorGenerator extends Generator {
  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) {
    final buffer = StringBuffer();

    for (final classElement in library.classes) {
      final validations = classElement.fields.expand<String>((field) sync* {
        final validators = field.metadata.where(isValidatorAnnotation);

        for (final validator in validators) {
          yield '${validator.toSource().replaceFirst('@', 'const ')}.validate(instance.${field.name});';
        }
      }).toList();

      if (validations.isNotEmpty) {
        buffer
          ..write(
              '_\$assert${classElement.name}(${classElement.name} instance) {')
          ..writeAll(validations)
          ..write('}');
      }
    }

    return buffer.toString();
  }
}

bool isValidatorAnnotation(ElementAnnotation annotation) {
  final element = annotation.element;
  if (element == null || element is! ConstructorElement) return false;

  return element.enclosingElement.allSupertypes.any((superType) {
    return superType.element.name == 'Validator' &&
        superType.element.librarySource.uri.toString() ==
            'package:cloud_firestore_odm/src/validator.dart';
  });
}
