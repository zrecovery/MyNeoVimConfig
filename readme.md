# My NeoVim Config

### 简介
用于个人使用的NeoVim配置。

### 背景
本人开发平台较多，情况复杂，无法保证每个平台都有可用的图形界面，各个IDE的远程开发也不一定可用。因此需要一个跨平台，可用的开发环境。

### 必要依赖
依赖|用途
ripgrep|快速搜索
Treesitter|语法高亮
lazygit|一个Git界面

###  用法
将配置本项目复制至NeoVim配置文件夹下，再安装Packer包管理，之后运行`:PackerSync`。

### 快捷键
default Leader Key is ','
Key|Binding
---|-------
<Leader>e|打开文件列表
<Leader>g|打开lazygit（一个Git界面）
<Leader>td|Terminal（目前为Lspsaga浮动窗口的终端）
<Leader>od|打开DBUI（数据库连接管理界面）

### 致谢
感谢glepnir的nvim项目。

### 如何贡献
如果有疑问，可以在issues中向我咨询。

### 许可证
MIT Licensed


