# VSCode

## Part 1 Key Binding

**官方快捷键: <https://code.visualstudio.com/docs/customization/keybindings>**

**Ctrl + P : 操作模式, 再输"?", 可以看见`所有可进行的操作`**
**Ctrl + Shift + P / F1 : 命令模式(显示所有命令 & 快捷键) <=> Ctrl + P 进入操作模式, 再输">"**

### 通用 快捷键

| Key | Value |
| --- | ----- |
| Ctrl + N/W :           | 新建/关闭文件 |
| Ctrl + Shift + N/W :   | 新建/关闭窗口 |
| Ctrl + Z/Y/A/O/S :     | Normal |
| Ctrl + X/C/V/D :       | 不选中则对整行操作 |
| Ctrl + F/H :           | \*: 1 or 多个; ?: 1个; \*\*: 任意个; {}: 一组条件; []: range |
| F3 / Shift + F3 :      | 查找时选择上/下一个 |
| Alt + 左/右 :          | 焦点的前进/后退 |
| Alt + 上/下 :          | 上/下移行 |
| Shift + Alt + 上/下 :  | 向上/下复制一行 |
| Shift + Alt :          | 块选择 |
| Ctrl + 上/下 :         | 屏幕向上/下移一行 |

### 高效 Level 1

| Key | Value |
| --- | ----- |
| Shift + Alt + F :            | 代码格式化 |
| Ctrl + Space :               | 触发建议 |
| Ctrl + Shift + Space :       | 触发参数提示 |
| Ctrl + / :                   | 触发行注释 == Ctrl+K Ctrl+C & Ctrl+K Ctrl+U |
| Shift + Alt + A :            | 触发块注释 |
| Ctrl + [ / ] :               | 减少/增加缩进 |
| Ctrl + Shift + [ / ] :       | 折叠/展开 |
| Ctrl + Shift + Alt + [ / ] : | 全部折叠/展开 |
| Ctrl + Shift + \ :           | 匹配括号的跳转 |
| Ctrl + Shift + C :           | 在此处打开命令行 |
| Ctrl + Shift + T :           | 重新打开关闭的文件 |
| Ctrl + Shift + X :           | 删除拖尾的空格 |
| Ctrl + Shift + J :           | Toggle Search Details ??? |
| Ctrl + Shift + . :           | Replace with Next Value ??? |
| Ctrl + Shift + , :           | Replace with Previous Value ??? |
| ~~Ctrl + Enter / Ctrl + Shift + Enter  :~~           | ~~当前行下/上边插入一行~~ |

### 高效 Level 2

| Key | Value |
| --- | ----- |
| ~~Ctrl + G :~~             | 转到行 <=> **Ctrl + P 进入操作模式, 再输":"** |
| ~~Ctrl + Shift + O :~~     | 转到符号(本文件) <=> **Ctrl + P 进入操作模式, 再输"@"或"@:"** |
| ~~Ctrl + T :~~             | 显示所有符号(本工作空间) <=> **Ctrl + P 进入操作模式, 再输"#"** |
| ~~Ctrl + Shift + M :~~     | 显示错误和警告 <=> **Ctrl + P 进入操作模式, 再输"!"** |
| F12 :                      | 转到定义(只有一个的时候) |
| Alt + F12 :                | 查看定义处的缩略图(不跳过去) |
| Ctrl + K F12 :             | 在侧边打开定义处 |
| Shift + F12 :              | 查看引用 |
| Ctrl + Shift + L :         | 同时选中所有匹配, 用于批量修改 (<=> 选中一个目标, 按Ctrl + F2)(不跨文件) |
| Alt + 单击 :               | 添加光标(多光标), 用于批量修改 |
| Ctrl + . :                 | Quick Fix |

### Debug & Tasks

| Key | Value |
| --- | ----- |
| F5 / Shift + F5 :   | start & pause & continue / stop |
| Ctrl + F5 :         | run |
| F8 / Shift + F8 :   | 转到下/上一个错误和警告 |
| F9 :                | 触发设断点 |
| F10 :               | 单步跳过 |
| F11 / Shift + F11 : | 单步调试 / 单步跳出 |
| Ctrl + K Ctrl + I : | Show Hover |
| Ctrl + Shift + B :  | 运行生成任务 |

### 窗口 相关

| Key | Value |
| --- | ----- |
| Ctrl + B :                 | 侧边栏开关 |
| Ctrl + Shift + E/F/G/D/U : | 侧边栏4大功能(在Bar打开的情况下)及输出窗口 |
| Ctrl + \ :                 | 分割窗口 |
| Ctrl + 0 :                 | 聚焦在Bar |
| Ctrl + 1 / 2 / 3 :         | 聚焦在窗口1 / 2 / 3 |
| Ctrl + ` :                 | 焦点在打开的窗口间循环 |
| Ctrl + Alt + 左/右 :       | 焦点切换到左/右窗口(没有则创建一个相同的) |
| Ctrl + K 左/右             | 将焦点所在窗口向左/右移动(不连续) |
| Ctrl + K Ctrl + P :        | 在不打开Bar的情况下, 查看workspace file |
| Ctrl + Tab :               | 导航(Ctrl + P)的历史记录 |

### Markdown 相关

| Key | Value |
| --- | ----- |
| Ctrl + Shift + V :    | 触发预览(Markdown) |
| Ctrl + K V :          | 打开侧边的预览(Markdown) |

## Part 2 Extension

扩展安装命令: `ext install ItemName`

| ItemName | Introduction |
| -------- | ------------ |
| [cpptools][idCPP]           | Complete C/C++ language support including code-editing and debugging |
| [python][idPY]              | Linting, Debugging (multi-threaded, remote), Intellisense, auto-completion, code formatting, snippets, and more |
| [vim][idVIM]                | Vim emulation for Visual Studio Code |
| [vscode-markdownlint][idMD] | Markdown linting and style checking for Visual Studio Code |

[idCPP]:https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
[idPY]:https://marketplace.visualstudio.com/items?itemName=donjayamanne.python
[idVIM]:https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
[idMD]:https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
