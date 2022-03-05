# GuitarAssistant

Guitar Assistant / 吉他助手

作为一个 Flutter 入门练手应用，顺便解决找不到干净好用的节拍器的问题。

前期主要关注 macOS 和 Android 平台。

## 功能特性

- [ ] 节拍器（WIP）
  - [x] BPM 简易展示和调整
  - [x] 拍号展示和调整
  - [x] 当前拍展示
  - [ ] 记住设置
  - [ ] 支持更多音效
  - [ ] 滑动调节 BPM
- [ ] 调音器（TODO）

## 运行效果

![](./screenshots/macos.png)

## 下载

<https://github.com/mzlogin/guitar_assistant/releases>

## 编译打包

### Android

```sh
flutter build apk --release
```

### macOS

```sh
flutter build macos --release
appdmg appdmg.json macos.dmg
```

### iOS

真机调试：<https://flutter.cn/docs/get-started/install/macos#deploy-to-ios-devices>

简而言之是需要先 `open ios/Runner.xcworkspace`，在 Xcode 配置好签名配置，构建运行 APP 后还需要在手机上「设置-通用-VPN 与设备管理」里信任开发者 APP。

iOS 模拟器：<https://flutter.cn/docs/get-started/install/macos#set-up-the-ios-simulator>，可以在 IDE 里启动或者执行命令 `open -a Simulator`。

一切准备妥当，并连接设备/启动模拟器后：

```sh
flutter run
```

## 已知问题

- [ ] BPM 高了以后，节奏不稳，有的拍子听不到声

## 参考

- <https://github.com/Tyrone2333/metronomelutter>
