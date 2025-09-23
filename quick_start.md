# 《医美消费心理学》网站快速启动指南

## 🚀 开始使用

您的《医美消费心理学》MkDocs网站已经准备就绪！以下是使用方法：

### 1. Wait for Installation to Complete
The Python packages are currently installing. Once complete, you can proceed.

### 2. Build and Run the Site

**Option A: Automatic (Recommended)**
```bash
# Double-click this file or run in terminal:
check_and_build.bat
```

**Option B: Manual Steps**
```bash
# Build the site
build_site.bat

# Run development server
run_local.bat
```

### 3. Access Your Website
- Open your browser
- Go to: `http://127.0.0.1:8000`
- Your book will be displayed as a beautiful website!

## 📁 What's Been Created

```
Your Project/
├── docs/                    # All your book chapters
│   ├── index.md            # Homepage
│   ├── 00-introduction.md  # Introduction
│   ├── 01-beauty-philosophy.md
│   ├── ... (all 13 chapters)
│   └── stylesheets/        # Custom styling
├── mkdocs.yml              # Website configuration
├── requirements.txt        # Python dependencies
├── run_local.bat          # Start development server
├── build_site.bat         # Build static site
└── check_and_build.bat    # Automated setup
```

## 🎨 Features

Your website includes:

- **📱 Responsive Design** - Works on all devices
- **🌙 Dark/Light Mode** - Automatic theme switching
- **🔍 Search** - Full-text search across all chapters
- **📖 Reading Progress** - Visual progress indicator
- **📋 Copy Code** - Easy code copying buttons
- **🧭 Navigation** - Tabbed navigation with sections
- **🎯 Chinese Support** - Optimized for Chinese content

## 🚀 Deployment Options

### GitHub Pages (Free Hosting)
1. Push your code to GitHub
2. Enable GitHub Pages in repository settings
3. Your site will be live at: `https://username.github.io/repository-name`

### Netlify (Free Hosting)
1. Connect your GitHub repository to Netlify
2. Build command: `mkdocs build`
3. Publish directory: `site`

### Manual Hosting
1. Run `build_site.bat`
2. Upload the `site/` folder to your web server

## 🛠️ Customization

### Adding New Content
1. Create new `.md` files in the `docs/` folder
2. Add them to the navigation in `mkdocs.yml`
3. The site will auto-reload with changes

### Styling
- Edit `docs/stylesheets/extra.css` for custom styles
- Modify `mkdocs.yml` for theme settings

### Configuration
- All settings are in `mkdocs.yml`
- See `SETUP.md` for detailed configuration options

## 📞 Need Help?

1. Check `SETUP.md` for detailed instructions
2. Review `README.md` for project overview
3. Visit [MkDocs Documentation](https://www.mkdocs.org/)
4. Check [Material Theme Docs](https://squidfunk.github.io/mkdocs-material/)

## 🎯 Next Steps

1. **Wait** for installation to complete
2. **Run** `check_and_build.bat`
3. **Open** `http://127.0.0.1:8000` in your browser
4. **Enjoy** your beautiful book website!

---

🎉 **Congratulations!** Your 190,000-word book is now a professional website!