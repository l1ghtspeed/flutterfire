// ignore_for_file: require_trailing_commas
// Copyright 2021 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_app_check_platform_interface/firebase_app_check_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'src/internals.dart';
import 'src/interop/app_check.dart' as app_check_interop;

class FirebaseAppCheckWeb extends FirebaseAppCheckPlatform {
  /// Stub initializer to allow the [registerWith] to create an instance without
  /// registering the web delegates or listeners.
  FirebaseAppCheckWeb._()
      : _webAppCheck = null,
        super(appInstance: null);

  /// The entry point for the [FirebaseAuthWeb] class.
  FirebaseAppCheckWeb({required FirebaseApp app}) : super(appInstance: app);

  /// Called by PluginRegistry to register this plugin for Flutter Web
  static void registerWith(Registrar registrar) {
    FirebaseCoreWeb.registerService('app-check');
    FirebaseAppCheckPlatform.instance = FirebaseAppCheckWeb.instance;
  }

  /// Initializes a stub instance to allow the class to be registered.
  static FirebaseAppCheckWeb get instance {
    return FirebaseAppCheckWeb._();
  }

  /// instance of AppCheck from the web plugin
  app_check_interop.AppCheck? _webAppCheck;

  /// Lazily initialize [_webAppCheck] on first method call
  app_check_interop.AppCheck get _delegate {
    return _webAppCheck ??= app_check_interop.getAppCheckInstance();
  }

  @override
  FirebaseAppCheckWeb setInitialValues() {
    return this;
  }

  @override
  Future<void> activate({String? webRecaptchaSiteKey}) async {
    return guard<Future<void>>(
        () async => _delegate.activate(webRecaptchaSiteKey));
  }
}
