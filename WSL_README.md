# WSL Ubuntu 22.04 开发指南

本指南介绍如何在 WSL Ubuntu 22.04 环境中开发和管理《医美消费心理学》电子书项目。

## 🚀 快速开始

### 1. 检查环境
```bash
wsl -d Ubuntu-22.04 -- bash -c "cd /mnt/d/codebuddy/psycho-2-codebuddy && ./wsl_dev.sh check"
```

### 2. 启动开发服务器
```bash
wsl -d Ubuntu-22.04 -- bash -c "cd /mnt/d/codebuddy/psycho-2-codebuddy && ./wsl_dev.sh serve"
```

### 3. 构建静态网站
```bash
wsl -d Ubuntu-22.04 -- bash -c "cd /mnt/d/codebuddy/psycho-2-codebuddy && ./wsl_dev.sh build"
```

## 📋 可用命令

我们提供了一个便捷的脚本 `wsl_dev.sh` 来管理项目：

| 命令 | 功能 | 说明 |
|------|------|------|
| `./wsl_dev.sh serve` | 启动开发服务器 | 在 http://localhost:8000 运行 |
| `./wsl_dev.sh build` | 构建静态网站 | 生成 site/ 目录 |
| `./wsl_dev.sh clean` | 清理构建文件 | 删除 site/ 目录内容 |
| `./wsl_dev.sh status` | 显示项目状态 | 查看项目信息 |
| `./wsl_dev.sh check` | 检查环境配置 | 验证依赖是否正确安装 |
| `./wsl_dev.sh help` | 显示帮助信息 | 查看所有可用命令 |

## 🔧 环境配置

### 系统信息
- **操作系统**: Ubuntu 22.04.5 LTS (Jammy Jellyfish)
- **Python**: 3.10.12
- **Node.js**: v21.7.3
- **MkDocs**: 1.6.1
- **Material Theme**: 9.6.16

### 路径配置
- **项目路径**: `/mnt/d/codebuddy/psycho-2-codebuddy`
- **MkDocs路径**: `/home/sooogooo/.local/bin/mkdocs`
- **Python包路径**: `/home/sooogooo/.local/lib/python3.10/site-packages`

## 🌐 访问网站

### 开发服务器
启动开发服务器后，可以通过以下方式访问：
- **本地访问**: http://localhost:8000
- **网络访问**: http://0.0.0.0:8000 (从其他设备访问)

### 热重载
开发服务器支持热重载，修改文件后会自动重新构建和刷新页面。

## 📁 项目结构

```
psycho-2-codebuddy/
├── docs/                    # 文档源文件目录
│   ├── index.md            # 主页
│   ├── stylesheets/        # 自定义样式
│   └── assets/             # 静态资源
├── site/                   # 构建输出目录
├── mkdocs.yml              # MkDocs 配置文件
├── wsl_dev.sh              # WSL 开发脚本
├── requirements.txt        # Python 依赖
└── *.md                    # 章节文件
```

## 🚨 常见问题

### 1. MkDocs 命令未找到
如果遇到 "mkdocs: command not found" 错误：
```bash
export PATH=/home/sooogooo/.local/bin:$PATH
```

### 2. 权限问题
如果脚本无法执行：
```bash
chmod +x wsl_dev.sh
```

### 3. 端口占用
如果 8000 端口被占用，可以指定其他端口：
```bash
mkdocs serve --dev-addr=0.0.0.0:8001
```

### 4. 构建失败
检查配置文件和文档格式：
```bash
mkdocs build --verbose
```

## 🔄 开发工作流

### 日常开发
1. 启动开发服务器
2. 编辑 Markdown 文件
3. 实时查看更改
4. 提交代码

### 发布准备
1. 清理旧文件: `./wsl_dev.sh clean`
2. 构建网站: `./wsl_dev.sh build`
3. 测试构建结果
4. 部署到服务器

## 📊 性能监控

### 构建时间
- 清理构建: ~2.6 秒
- 增量构建: ~1.2 秒

### 文件统计
- Markdown 文件: 23 个
- 总字数: ~19万字
- 构建大小: ~5.0MB

## 🤝 协作开发

### Git 工作流
```bash
# 在 WSL 中使用 Git
git status
git add .
git commit -m "更新章节内容"
git push
```

### 多人协作
- 使用分支进行功能开发
- 定期同步主分支
- 使用 Pull Request 进行代码审查

## 📞 技术支持

如需技术支持，请：
1. 首先运行 `./wsl_dev.sh check` 检查环境
2. 查看错误日志
3. 搜索相关文档
4. 联系项目维护者

---

*最后更新: 2024年9月*
*环境: WSL Ubuntu 22.04.5 LTS*