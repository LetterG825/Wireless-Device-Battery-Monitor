# 无线设备电量监视器 · 简体中文定制版

版本：**1.0.7-zh-CN.1**。修改日期：2026-11-18。

本分支基于 [krisgfx9/Wireless-Device-Battery-Monitor](https://github.com/krisgfx9/Wireless-Device-Battery-Monitor) 的 **v1.0.7**，为非官方简体中文定制版，由 LetterG825 维护。保留原项目作者信息与 GPL-3.0 许可证。

原项目当前主分支已经加入中文和多语言支持；本分支用于保存基于 v1.0.7 的独立中文构建，不代表最新官方版本。

## 下载与使用

从本仓库的 [Releases](https://github.com/LetterG825/Wireless-Device-Battery-Monitor/releases) 下载 `WirelessBattery-1.0.7-zh-CN-portable.zip`，完整解压后运行 `WirelessBattery.exe`。请将 `headsetcontrol.exe` 保持在主程序同一目录。

点击任务栏电量区域或系统托盘图标打开中文菜单，可立即刷新、隐藏设备、调整顺序、切换任务栏/托盘模式，以及设置开机自启。
同一时间只能运行一个实例；已有版本运行时，请先从菜单“退出”。设备支持范围继承官方 v1.0.7。

## 汉化内容

- 菜单、悬停提示、电量状态及低电量通知。
- 连接方式显示、耳机左右耳和充电盒提示。
- 设备支持申请窗口、按钮、提示和设备类型下拉列表。
- 程序文件的中文名称与版本信息。

品牌和型号保持原名。提交给原作者的设备类型编码、技术报告和服务端错误原文保留英文，以便诊断；界面会提示这些内容。
设备支持窗口仍使用原项目的 `krisgfx.com` 服务，只有用户点击“发送”时才提交预览中显示的信息。
此发布为便携版，不包含中文安装向导。

## 编译

Windows x64，安装 Visual Studio 的“使用 C++ 的桌面开发”工作负载和 Windows SDK，然后运行：

```bat
build-zh-msvc.cmd
```

脚本使用 `vswhere` 查找 Visual Studio；也可在已配置的 x64 Developer Command Prompt 内运行。
源码使用 UTF-8，编译使用 `/utf-8`；`/MT` 静态链接 C++ 运行库。
原有 MinGW 构建方式见下方原项目 README。

## 修改与验证

本次改动集中在界面文字和显示层：`src/zh_cn.h` 仅翻译呈现给用户的连接方式与电量文本，不更改协议值、设备 ID 或保存的设置。
为兼容 MSVC，另外显式捕获了雷蛇驱动中的局部 `constexpr`，并使用 SDK 标准 WinRT `IReference<INT32>` 类型名。

已通过 Windows x64 MSVC 编译，检查了中文表单的字体与排版，并验证 `--list` 查询正常退出。
未针对所有支持设备进行实机验证。更新官方程序会覆盖本分支的汉化改动。

## 来源与许可证

- 原项目及主要设备协议实现归原作者和贡献者所有，详见原 README、源码与 `LICENSE`。
- 本分支的修改继续使用原项目 GPL-3.0 许可证，源码随 Release 提供。
- 随包附带的 HeadsetControl 4.3.0 为未修改的官方二进制，详见 `THIRD_PARTY_NOTICES.txt`；其对应源码随 Release 附带，亦可从 [官方发行页](https://github.com/Sapd/HeadsetControl/releases/tag/4.3.0) 获取。
