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

目前没有注册开发者账号，真机调试运行（需要先 `open ios/Runner.xcworkspace`，在 Xcode 配置好签名配置）：

```sh
flutter run
```

## 已知问题

- [ ] BPM 高了以后，节奏不稳，有的拍子听不到声

## 参考

- <https://github.com/Tyrone2333/metronomelutter>
