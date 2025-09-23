# 医美消费心理学

深度解析医美消费背后的心理机制与决策过程，使用 MkDocs 和 Material 主题构建的专业网站。

## 🚀 Quick Start

### Prerequisites

- Python 3.7+
- pip

### Installation

1. Clone this repository:
```bash
git clone <your-repo-url>
cd psycho-2-codebuddy
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Serve the documentation locally:
```bash
mkdocs serve
```

4. Open your browser and navigate to `http://127.0.0.1:8000`

## 📖 About the Book

This book explores the psychological aspects of medical aesthetics, providing:

- **Theoretical Foundations**: Philosophical and scientific frameworks
- **Psychological Mechanisms**: Deep dive into decision-making psychology
- **Social Impact**: Analysis of cultural and social influences
- **Future Trends**: Technology and ethical considerations

## 🏗️ Building for Production

To build the static site for deployment:

```bash
mkdocs build
```

The built site will be in the `site/` directory.

## 📁 Project Structure

```
.
├── docs/                   # Documentation source files
│   ├── index.md           # Homepage
│   ├── 00-introduction.md # Introduction
│   ├── 01-beauty-philosophy.md
│   ├── ...                # Chapter files
│   └── stylesheets/       # Custom CSS
├── mkdocs.yml             # MkDocs configuration
├── requirements.txt       # Python dependencies
└── README.md             # This file
```

## 🎨 Customization

### Theme Configuration

The site uses Material for MkDocs with custom styling. Key features:

- **Dark/Light Mode Toggle**: Automatic theme switching
- **Chinese Font Support**: Optimized for Chinese content
- **Navigation**: Tabbed navigation with sections
- **Search**: Full-text search in Chinese
- **Mobile Responsive**: Optimized for all devices

### Custom Styling

Custom CSS is located in `docs/stylesheets/extra.css` and includes:

- Enhanced Chinese typography
- Custom admonition styles
- Improved table and code block styling
- Responsive design improvements

## 📝 Content Management

### Adding New Chapters

1. Create a new markdown file in the `docs/` directory
2. Add the file to the `nav` section in `mkdocs.yml`
3. Use consistent formatting and structure

### Markdown Extensions

The site supports advanced markdown features:

- **Admonitions**: `!!! note`, `!!! warning`, etc.
- **Code Highlighting**: Syntax highlighting for multiple languages
- **Tables**: Enhanced table styling
- **Footnotes**: Academic-style footnotes
- **Emoji**: Material Design emoji support

## 🚀 Deployment Options

### GitHub Pages

1. Enable GitHub Pages in repository settings
2. Use GitHub Actions for automatic deployment:

```yaml
name: Deploy MkDocs
on:
  push:
    branches: [ main ]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-python@v2
      with:
        python-version: 3.x
    - run: pip install -r requirements.txt
    - run: mkdocs gh-deploy --force
```

### Netlify

1. Connect your repository to Netlify
2. Set build command: `mkdocs build`
3. Set publish directory: `site`

### Vercel

1. Import your repository to Vercel
2. Set build command: `mkdocs build`
3. Set output directory: `site`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `mkdocs serve`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [MkDocs](https://www.mkdocs.org/) - Static site generator
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) - Beautiful theme
- All contributors and readers who made this project possible

---

For questions or support, please open an issue in the repository.