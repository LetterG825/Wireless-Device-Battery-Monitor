#pragma once
#include <string>
// Translate display text only; protocol values and stored device IDs stay unchanged.
inline std::wstring ZhDisplay(std::wstring value) {
    static const struct { const wchar_t* en; const wchar_t* zh; } labels[] = {
        {L"2.4 GHz receiver / USB", L"2.4 GHz 接收器 / USB"},
        {L"2.4 GHz receiver", L"2.4 GHz 接收器"}, {L"USB cable", L"USB 有线"},
        {L"Xbox Wireless / Bluetooth", L"Xbox 无线 / 蓝牙"},
        {L"Xbox Wireless", L"Xbox 无线"}, {L"Bluetooth", L"蓝牙"},
        {L"Wireless adapter", L"无线适配器"}, {L"Razer receiver", L"雷蛇接收器"},
        {L"ROG Omni Receiver", L"ROG Omni 接收器"}, {L"UWB base station", L"UWB 基站"},
        {L"Phone Link", L"手机连接"}, {L"Empty", L"即将耗尽"}, {L"Low", L"低电量"},
        {L"Medium", L"中等电量"}, {L"Full", L"满电"},
        {L"L ", L"左耳 "}, {L"R ", L"右耳 "}, {L"case ", L"充电盒 "}
    };
    for (const auto& label : labels) {
        size_t pos = 0;
        while ((pos = value.find(label.en, pos)) != std::wstring::npos) {
            value.replace(pos, wcslen(label.en), label.zh);
            pos += wcslen(label.zh);
        }
    }
    return value;
}
