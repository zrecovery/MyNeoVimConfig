# My NeoVim Config

## 简介
用于个人使用的NeoVim配置。

## 目录
- [背景](#背景)
- [依赖](#依赖)
- [安装](#安装)
- [快捷键](#快捷键)
- [致谢](#致谢)
- [贡献](#贡献)
- [许可证](#许可证)

## 背景
本人开发平台较多，情况复杂，无法保证每个平台都有可用的图形界面，各个IDE的远程开发也不一定可用。因此需要一个跨平台，可用的开发环境。

## 依赖
依赖|用途
----|----
ripgrep|快速搜索
TreeSitter|语法高亮
LazyGIT|一个Git界面
Fzy|模糊搜索
Node|部分语言服务需要(本项目实际上不需要)
sumneko/lua-language-server|Lua语言服务
apple/sourcekit-lsp|Swift语言服务

## 安装
先安装NeoVim及必要依赖。
将配置本项目复制至NeoVim配置文件夹下，再安装Packer包管理，之后运行`:PackerSync`。
Lua语言服务需要手动设置路径，在`lua/modules/completion/config.lua`中。

## 快捷键
默认Leader键为','。
Key|Binding
---|-------
<Leader>e|打开文件列表
<Leader>g|打开lazygit（一个Git界面）
<Leader>td|Terminal（目前为Lspsaga浮动窗口的终端）
<Leader>od|打开DBUI（数据库连接管理界面）

## 致谢
感谢glepnir的nvim项目。

## 贡献
如果有疑问，可以在issues中向我咨询。

## 许可证
[MIT](LICENSE) @ Zrecovery


