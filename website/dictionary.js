module.exports = [
  // e.g. FooBar
  /^[A-Z].*/,
  // e.g. fooBar or .fooBar
  /^\.?[a-z0-9].*[A-Z0-9].*/,
  // e.g foo_bar or foo-bar-baz
  /^[a-z]*[-_][a-z]+.*/,
  // e.g. package:melos,
  /^package:.*/,

  // Known words;
  '&raquo',
  '.dex',
  'acs',
  'alloc',
  'analytics',
  'applinks',
  'apns',
  'aps',
  'async',
  'auth',
  'authenticator',
  'backend',
  'backoff',
  'bool',
  'br',
  'buildscript',
  'cd',
  'chainable',
  'changelog',
  'charset',
  'classpath',
  'classpaths',
  'cocoapods',
  'codelab',
  'config',
  'const',
  'crashlytics',
  'crypto',
  'cryptographically',
  'datastore',
  'deprecations',
  'dex',
  'dropdown',
  'filesystem',
  'firebase',
  'firestore',
  'FlutterFire',
  'func',
  'getter',
  'getters',
  'globals',
  'gradle',
  'gradlew',
  'href',
  'html',
  'http',
  'https',
  'img',
  'init',
  'installable',
  'ios',
  'javascript',
  'js',
  'json',
  'keychain',
  'localhost',
  'macos',
  'multidex',
  'natively',
  'objectivec',
  'passwordless',
  'plist',
  'realtime',
  'reauthenticate',
  'repo',
  'roadmap',
  'safelist',
  'scalable',
  'sdk',
  'src',
  'timeframe',
  'twittersdk',
  'unencrypted',
  'unlink',
  'unlinked',
  'unlinking',
  'untampered',
  'untrusted',
  'url',
  'uri',
  'verifications',
  'web.firebase_cdn',
  'xml',
  'yaml',
];
