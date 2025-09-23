#!/bin/bash

# Medical Aesthetics Psychology Book - WSL Development Script
# This script provides convenient commands for managing the project in WSL Ubuntu 22.04

# Set PATH to include mkdocs
export PATH=/home/sooogooo/.local/bin:$PATH

# Project directory
PROJECT_DIR="/mnt/d/codebuddy/psycho-2-codebuddy"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== 医美消费心理学电子书 - WSL Ubuntu 22.04 开发环境 ===${NC}"
echo -e "${GREEN}项目目录: ${PROJECT_DIR}${NC}"
echo ""

function show_help() {
    echo -e "${YELLOW}可用命令:${NC}"
    echo "  serve     - 启动开发服务器 (http://localhost:8000)"
    echo "  build     - 构建静态网站"
    echo "  clean     - 清理构建文件"
    echo "  status    - 显示项目状态"
    echo "  check     - 检查环境配置"
    echo "  github    - 检查GitHub认证状态"
    echo "  help      - 显示此帮助信息"
    echo ""
}

function start_server() {
    echo -e "${GREEN}启动MkDocs开发服务器...${NC}"
    cd "$PROJECT_DIR"
    mkdocs serve --dev-addr=0.0.0.0:8000
}

function build_site() {
    echo -e "${GREEN}构建静态网站...${NC}"
    cd "$PROJECT_DIR"
    mkdocs build --clean
    echo -e "${GREEN}构建完成! 文件位于 site/ 目录${NC}"
}

function clean_site() {
    echo -e "${YELLOW}清理构建文件...${NC}"
    cd "$PROJECT_DIR"
    if [ -d "site" ]; then
        rm -rf site/*
        echo -e "${GREEN}清理完成!${NC}"
    else
        echo -e "${YELLOW}没有找到构建文件${NC}"
    fi
}

function show_status() {
    echo -e "${BLUE}=== 项目状态 ===${NC}"
    cd "$PROJECT_DIR"
    echo -e "${YELLOW}当前目录:${NC} $(pwd)"
    echo -e "${YELLOW}MkDocs版本:${NC} $(mkdocs --version)"
    echo -e "${YELLOW}Python版本:${NC} $(python3 --version)"
    
    if [ -d "site" ]; then
        site_size=$(du -sh site 2>/dev/null | cut -f1 2>/dev/null || echo "未知")
        echo -e "${YELLOW}构建目录大小:${NC} ${site_size}"
    else
        echo -e "${YELLOW}构建状态:${NC} 未构建"
    fi
    
    echo -e "${YELLOW}章节文件:${NC}"
    file_count=$(find . -name "*.md" -maxdepth 1 | wc -l 2>/dev/null || echo "未知")
    echo "  Markdown文件数量: ${file_count}"
}

function check_env() {
    echo -e "${BLUE}=== 环境检查 ===${NC}"
    
    # Check Python
    if command -v python3 >/dev/null 2>&1; then
        echo -e "${GREEN}✓ Python3 已安装:${NC} $(python3 --version)"
    else
        echo -e "${RED}✗ Python3 未找到${NC}"
    fi
    
    # Check MkDocs
    if command -v mkdocs >/dev/null 2>&1; then
        echo -e "${GREEN}✓ MkDocs 已安装:${NC} $(mkdocs --version)"
    else
        echo -e "${RED}✗ MkDocs 未找到${NC}"
    fi
    
    # Check project files
    cd "$PROJECT_DIR"
    if [ -f "mkdocs.yml" ]; then
        echo -e "${GREEN}✓ MkDocs 配置文件存在${NC}"
    else
        echo -e "${RED}✗ MkDocs 配置文件不存在${NC}"
    fi
    
    if [ -d "docs" ]; then
        echo -e "${GREEN}✓ 文档目录存在${NC}"
    else
        echo -e "${RED}✗ 文档目录不存在${NC}"
    fi
}

function check_github() {
    echo -e "${BLUE}=== GitHub 认证检查 ===${NC}"
    
    # Check Git version
    if command -v git >/dev/null 2>&1; then
        echo -e "${GREEN}✓ Git 已安装:${NC} $(git --version)"
    else
        echo -e "${RED}✗ Git 未找到${NC}"
        return 1
    fi
    
    # Check Git configuration
    echo -e "${YELLOW}Git 配置信息:${NC}"
    git_user=$(git config --global user.name 2>/dev/null)
    git_email=$(git config --global user.email 2>/dev/null)
    
    if [ -n "$git_user" ]; then
        echo -e "  用户名: ${GREEN}$git_user${NC}"
    else
        echo -e "  用户名: ${RED}未设置${NC}"
    fi
    
    if [ -n "$git_email" ]; then
        echo -e "  邮箱: ${GREEN}$git_email${NC}"
    else
        echo -e "  邮箱: ${RED}未设置${NC}"
    fi
    
    # Check SSH keys
    echo -e "${YELLOW}SSH 密钥检查:${NC}"
    if [ -f ~/.ssh/id_rsa.pub ] || [ -f ~/.ssh/id_ed25519.pub ]; then
        echo -e "${GREEN}✓ SSH 密钥存在${NC}"
        if [ -f ~/.ssh/id_ed25519.pub ]; then
            echo -e "  Ed25519 密钥: ${GREEN}存在${NC}"
        fi
        if [ -f ~/.ssh/id_rsa.pub ]; then
            echo -e "  RSA 密钥: ${GREEN}存在${NC}"
        fi
    else
        echo -e "${RED}✗ 未找到 SSH 密钥${NC}"
    fi
    
    # Test GitHub SSH connection
    echo -e "${YELLOW}GitHub SSH 连接测试:${NC}"
    ssh_result=$(ssh -T git@github.com 2>&1)
    if echo "$ssh_result" | grep -q "successfully authenticated"; then
        echo -e "${GREEN}✓ GitHub SSH 认证成功${NC}"
        # Extract username from the response
        username=$(echo "$ssh_result" | grep -o "Hi [^!]*" | cut -d' ' -f2)
        if [ -n "$username" ]; then
            echo -e "  GitHub 用户名: ${GREEN}$username${NC}"
        fi
    else
        echo -e "${RED}✗ GitHub SSH 认证失败${NC}"
        echo -e "  ${YELLOW}错误信息: $ssh_result${NC}"
    fi
    
    # Check GitHub CLI
    if command -v gh >/dev/null 2>&1; then
        echo -e "${GREEN}✓ GitHub CLI 已安装:${NC} $(gh --version | head -n1)"
        gh_auth=$(gh auth status 2>&1)
        if echo "$gh_auth" | grep -q "Logged in"; then
            echo -e "${GREEN}✓ GitHub CLI 已登录${NC}"
        else
            echo -e "${YELLOW}! GitHub CLI 未登录${NC}"
        fi
    else
        echo -e "${YELLOW}! GitHub CLI 未安装${NC}"
        echo -e "  ${BLUE}提示: 可以通过以下命令安装 GitHub CLI:${NC}"
        echo -e "  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
        echo -e "  sudo apt update && sudo apt install gh"
    fi
    
    # Check if current directory is a git repository
    cd "$PROJECT_DIR"
    if git rev-parse --git-dir >/dev/null 2>&1; then
        echo -e "${GREEN}✓ 当前目录是 Git 仓库${NC}"
        echo -e "  ${YELLOW}远程仓库:${NC}"
        git remote -v 2>/dev/null | while read line; do
            echo -e "    $line"
        done
    else
        echo -e "${YELLOW}! 当前目录不是 Git 仓库${NC}"
        echo -e "  ${BLUE}提示: 可以通过以下命令初始化:${NC}"
        echo -e "  git init"
        echo -e "  git remote add origin git@github.com:sooogooo/psycho-2-codebuddy.git"
    fi
}

# Main script logic
case "$1" in
    "serve")
        start_server
        ;;
    "build")
        build_site
        ;;
    "clean")
        clean_site
        ;;
    "status")
        show_status
        ;;
    "check")
        check_env
        ;;
    "github")
        check_github
        ;;
    "help"|"")
        show_help
        ;;
    *)
        echo -e "${RED}未知命令: $1${NC}"
        show_help
        exit 1
        ;;
esac