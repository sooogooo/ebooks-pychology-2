# MkDocs Website Setup Guide

## 📋 Prerequisites

- Python 3.7 or higher
- pip (Python package installer)
- Git (for version control and deployment)

## 🚀 Quick Setup

### 1. Install Dependencies

```bash
# Install Python dependencies
pip install -r requirements.txt

# Verify installation
python -m mkdocs --version
```

### 2. Start Development Server

```bash
# Option 1: Using MkDocs directly
mkdocs serve

# Option 2: Using our custom script
python serve.py

# Option 3: Using npm scripts
npm run dev
```

The site will be available at `http://127.0.0.1:8000`

### 3. Build for Production

```bash
# Build static site
mkdocs build

# The built site will be in the 'site/' directory
```

## 📁 Project Structure

```
psycho-2-codebuddy/
├── docs/                          # Documentation source
│   ├── index.md                   # Homepage
│   ├── 00-introduction.md         # Introduction
│   ├── 01-beauty-philosophy.md    # Chapter 1
│   ├── ...                        # Other chapters
│   ├── stylesheets/
│   │   └── extra.css             # Custom styles
│   └── overrides/
│       └── main.html             # Custom template
├── .github/
│   └── workflows/
│       └── deploy.yml            # GitHub Actions
├── mkdocs.yml                    # MkDocs configuration
├── requirements.txt              # Python dependencies
├── package.json                  # NPM scripts
├── serve.py                      # Development server script
├── deploy.sh                     # Deployment script
└── README.md                     # Project documentation
```

## 🎨 Features

### Theme Features
- **Material Design**: Modern, responsive design
- **Dark/Light Mode**: Automatic theme switching
- **Chinese Font Support**: Optimized typography
- **Mobile Responsive**: Works on all devices
- **Search**: Full-text search functionality

### Custom Features
- **Reading Progress**: Visual progress indicator
- **Copy Code Buttons**: Easy code copying
- **Smooth Scrolling**: Enhanced navigation
- **Custom Admonitions**: Special content blocks

### Navigation
- **Tabbed Navigation**: Organized by sections
- **Expandable Sections**: Hierarchical structure
- **Footer Navigation**: Previous/next chapter links
- **Table of Contents**: Auto-generated TOC

## 🚀 Deployment Options

### GitHub Pages (Recommended)

1. **Automatic Deployment**: Push to main branch triggers deployment
2. **Custom Domain**: Configure in repository settings
3. **HTTPS**: Automatic SSL certificate

```bash
# Manual deployment
mkdocs gh-deploy --force
```

### Netlify

1. Connect repository to Netlify
2. Build command: `mkdocs build`
3. Publish directory: `site`

### Vercel

1. Import repository to Vercel
2. Build command: `mkdocs build`
3. Output directory: `site`

### Traditional Web Hosting

1. Build the site: `mkdocs build`
2. Upload `site/` directory to your web server
3. Configure web server to serve static files

## 🛠️ Customization

### Styling

Edit `docs/stylesheets/extra.css` to customize:
- Colors and themes
- Typography
- Layout and spacing
- Component styling

### Configuration

Edit `mkdocs.yml` to modify:
- Site metadata
- Navigation structure
- Plugin settings
- Theme configuration

### Content

- Add new chapters in `docs/` directory
- Update navigation in `mkdocs.yml`
- Use Markdown with extensions for rich content

## 📝 Content Guidelines

### Markdown Extensions

The site supports:

```markdown
# Headers with auto-generated anchors

!!! note "Admonitions"
    Special content blocks for notes, warnings, tips

```python
# Code blocks with syntax highlighting
def example():
    return "Hello, World!"
```

| Tables | Are | Supported |
|--------|-----|-----------|
| With   | Nice| Styling   |

[Links with tooltips](https://example.com "Tooltip text")

==Highlighted text==

~~Strikethrough text~~

- [x] Task lists
- [ ] With checkboxes
```

### Custom Admonitions

```markdown
!!! case-study "案例分析"
    Use this for case studies and examples

!!! tip "实用建议"
    Practical tips and recommendations

!!! warning "注意事项"
    Important warnings and cautions
```

## 🔧 Troubleshooting

### Common Issues

1. **MkDocs not found**
   ```bash
   pip install mkdocs mkdocs-material
   ```

2. **Build errors**
   ```bash
   mkdocs build --verbose
   ```

3. **Plugin errors**
   ```bash
   pip install --upgrade -r requirements.txt
   ```

4. **Encoding issues**
   - Ensure all files are saved in UTF-8
   - Check locale settings

### Performance Optimization

1. **Image Optimization**
   - Compress images before adding
   - Use appropriate formats (WebP, PNG, JPG)
   - Consider lazy loading for large images

2. **Content Optimization**
   - Keep pages reasonably sized
   - Use code folding for long code blocks
   - Optimize search index

## 📊 Analytics and SEO

### Google Analytics

1. Get tracking ID from Google Analytics
2. Update `mkdocs.yml`:
   ```yaml
   extra:
     analytics:
       provider: google
       property: G-XXXXXXXXXX
   ```

### SEO Optimization

- Descriptive page titles
- Meta descriptions
- Structured navigation
- Semantic HTML
- Fast loading times

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes and test locally
4. Submit a pull request

### Development Workflow

```bash
# Start development server
mkdocs serve

# Make changes to content
# Server auto-reloads

# Test build
mkdocs build

# Deploy when ready
mkdocs gh-deploy
```

## 📞 Support

For issues and questions:

1. Check this setup guide
2. Review MkDocs documentation
3. Check Material theme documentation
4. Open an issue in the repository

## 🎯 Next Steps

1. **Content**: Continue adding and refining chapters
2. **Design**: Customize styling and layout
3. **Features**: Add interactive elements
4. **SEO**: Optimize for search engines
5. **Analytics**: Set up tracking and monitoring

---

Happy documenting! 📚✨