# Changelog
## 2.0.8 (2022-10-06)
- Updated Castle Android SDK to 3.0.7

## 2.0.7 (2022-09-19)
- Updated Castle Android SDK to 3.0.6

## 2.0.6 (2022-08-09)
- Updated Castle Android SDK to 3.0.5
- Updated Castle iOS SDK to 3.0.7

## 2.0.5 (2022-06-30)
- Updated Castle Android SDK to 3.0.4
- Updated Castle iOS SDK to 3.0.6

## 2.0.4 (2022-05-11)
- Updated Castle iOS SDK to 3.0.5

## 2.0.3 (2022-04-29)
- Updated Castle Android SDK to 3.0.3
- Updated Castle iOS SDK to 3.0.4

## 2.0.2 (2022-04-08)
- Updated Castle Android SDK to 3.0.2
- Updated Castle iOS SDK to 3.0.3

## 2.0.1 (2022-03-30)
- Updated Castle Android SDK to 3.0.1
- Updated Castle iOS SDK to 3.0.2

## 2.0.0 (2022-03-16)
- Updated Castle Android SDK to 3.0.0
- Updated Castle iOS SDK to 3.0.1

- Add support for enhanced user activity monitoring.
	- Introduced custom(name) method
	- Introduced custom(name, properties) method
	- Introduced screen(name) method
	- Introduced userJwt(jwt) method
- Remove deprecated methods.
	- Removed identify()
	- Removed userId()
	- Removed secure()
	- Removed secureModeEnabled()
	- Removed userSignature()
	- Removed track()
	- Removed useCloudflareApp()
	- Removed clientIdHeaderName()
	- Removed clientId()
	- Removed baseUrl()

## 1.1.5 (2022-03-14)
**Fixes**

- Updated Castle iOS SDK to 2.1.8. (*Updated internal library because of an issue with the vendored framework included in the 2.1.7 release.*)

## 1.1.4 (2022-03-03)
- Updated Castle Android SDK to 2.1.4
- Updated Castle iOS SDK to 2.1.7

## 1.1.3 (2022-02-10)
- Updated Castle Android SDK to 2.1.3
- Updated Castle iOS SDK to 2.1.6

## 1.1.2 (2021-09-20)
- Updated Castle Android SDK to 2.1.2
- Updated Castle iOS SDK to 2.1.2

## 1.1.1 (2021-06-31)
- [#19](https://github.com/castle/castle-flutter/pull/19) Make UserId nullable in Android bridge
- [#18](https://github.com/castle/castle-flutter/pull/18) Migrate code to null safety

## 1.1.0 (2021-06-08)
- Updated Castle Android SDK to 2.1.0
- Updated Castle iOS SDK to 2.1.1
- Added `createRequestToken` and `requestTokenHeaderName` functions

## 1.0.4 (2021-05-03)
**Bug fixes:**

- [#14](https://github.com/castle/castle-flutter/pull/14) update to Castle Android 2.0.3

## 1.0.3 (2021-05-03)
**Bug fixes:**

- [#11](https://github.com/castle/castle-flutter/pull/11) update to Castle Android 2.0.2

## 1.0.2 (2021-04-28)
**Bug fixes:**

- [#10](https://github.com/castle/castle-flutter/pull/10) update to Castle Android 2.0.1
- [#9](https://github.com/castle/castle-flutter/pull/9) update to Castle iOS 2.0.0

## 1.0.1 (2021-03-25)
**Enhancements:**

- [#6](https://github.com/castle/castle-flutter/pull/6) update badges and instructions

## 1.0.0 (2021-03-24)
Initial public release
