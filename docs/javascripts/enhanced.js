// Enhanced JavaScript for Medical Aesthetics Psychology Book

document.addEventListener('DOMContentLoaded', function() {
    // Reading progress indicator
    createReadingProgress();
    
    // Enhanced search functionality
    enhanceSearch();
    
    // Chapter navigation
    addChapterNavigation();
    
    // Smooth scrolling for anchor links
    enableSmoothScrolling();
    
    // Print functionality
    addPrintButton();
    
    // Reading time estimation
    addReadingTime();
    
    // Bookmark functionality
    addBookmarkFeature();
});

// Reading progress indicator
function createReadingProgress() {
    const progressBar = document.createElement('div');
    progressBar.className = 'reading-progress';
    progressBar.style.transform = 'scaleX(0)';
    document.body.appendChild(progressBar);
    
    window.addEventListener('scroll', function() {
        const scrollTop = window.pageYOffset;
        const docHeight = document.body.scrollHeight - window.innerHeight;
        const scrollPercent = scrollTop / docHeight;
        progressBar.style.transform = `scaleX(${scrollPercent})`;
    });
}

// Enhanced search with suggestions
function enhanceSearch() {
    const searchInput = document.querySelector('.md-search__input');
    if (searchInput) {
        // Add search suggestions based on chapter titles
        const chapters = [
            '美学哲学基础', '科学思维应用', '美的测量', '文化建构',
            '数字镜像', '人格滤镜', '身体意象', '亲密关系',
            '认知陷阱', '群体力量', '伦理边界', '技术革新'
        ];
        
        searchInput.addEventListener('input', function(e) {
            const query = e.target.value.toLowerCase();
            if (query.length > 1) {
                const suggestions = chapters.filter(chapter => 
                    chapter.toLowerCase().includes(query)
                );
                // Display suggestions (implementation depends on MkDocs search plugin)
            }
        });
    }
}

// Chapter navigation
function addChapterNavigation() {
    const content = document.querySelector('.md-content__inner');
    if (content && window.location.pathname.includes('chapter')) {
        const nav = document.createElement('div');
        nav.className = 'chapter-nav';
        
        // Get current chapter number from URL or title
        const currentChapter = getCurrentChapter();
        
        if (currentChapter > 1) {
            const prevLink = document.createElement('a');
            prevLink.href = `${String(currentChapter - 1).padStart(2, '0')}-*.md`;
            prevLink.textContent = '← 上一章';
            nav.appendChild(prevLink);
        }
        
        if (currentChapter < 13) {
            const nextLink = document.createElement('a');
            nextLink.href = `${String(currentChapter + 1).padStart(2, '0')}-*.md`;
            nextLink.textContent = '下一章 →';
            nav.appendChild(nextLink);
        }
        
        content.appendChild(nav);
    }
}

// Get current chapter number
function getCurrentChapter() {
    const path = window.location.pathname;
    const match = path.match(/(\d+)-/);
    return match ? parseInt(match[1]) : 1;
}

// Smooth scrolling for anchor links
function enableSmoothScrolling() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// Add print button
function addPrintButton() {
    const toolbar = document.querySelector('.md-header__inner');
    if (toolbar) {
        const printBtn = document.createElement('button');
        printBtn.innerHTML = '🖨️ 打印';
        printBtn.className = 'md-header__button md-icon';
        printBtn.style.marginLeft = '10px';
        printBtn.addEventListener('click', function() {
            window.print();
        });
        toolbar.appendChild(printBtn);
    }
}

// Reading time estimation
function addReadingTime() {
    const content = document.querySelector('.md-content__inner');
    if (content) {
        const text = content.textContent || content.innerText;
        const wordsPerMinute = 200; // Average reading speed for Chinese
        const words = text.trim().split(/\s+/).length;
        const readingTime = Math.ceil(words / wordsPerMinute);
        
        const timeIndicator = document.createElement('div');
        timeIndicator.innerHTML = `📖 预计阅读时间：${readingTime} 分钟`;
        timeIndicator.style.cssText = `
            background: rgba(46, 125, 138, 0.1);
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 0.9rem;
            color: #2e7d8a;
        `;
        
        const firstHeading = content.querySelector('h1');
        if (firstHeading) {
            firstHeading.parentNode.insertBefore(timeIndicator, firstHeading.nextSibling);
        }
    }
}

// Bookmark functionality
function addBookmarkFeature() {
    const bookmarks = JSON.parse(localStorage.getItem('bookmarks') || '[]');
    
    // Add bookmark button to each section
    document.querySelectorAll('h2, h3').forEach(heading => {
        const bookmarkBtn = document.createElement('button');
        bookmarkBtn.innerHTML = '🔖';
        bookmarkBtn.className = 'bookmark-btn';
        bookmarkBtn.style.cssText = `
            margin-left: 10px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1.2em;
            opacity: 0.6;
            transition: opacity 0.3s;
        `;
        
        const headingId = heading.id || heading.textContent.replace(/\s+/g, '-').toLowerCase();
        heading.id = headingId;
        
        if (bookmarks.includes(headingId)) {
            bookmarkBtn.style.opacity = '1';
        }
        
        bookmarkBtn.addEventListener('click', function() {
            toggleBookmark(headingId, bookmarkBtn);
        });
        
        heading.appendChild(bookmarkBtn);
    });
}

function toggleBookmark(id, button) {
    let bookmarks = JSON.parse(localStorage.getItem('bookmarks') || '[]');
    
    if (bookmarks.includes(id)) {
        bookmarks = bookmarks.filter(b => b !== id);
        button.style.opacity = '0.6';
    } else {
        bookmarks.push(id);
        button.style.opacity = '1';
    }
    
    localStorage.setItem('bookmarks', JSON.stringify(bookmarks));
}

// Table of contents enhancement
function enhanceTableOfContents() {
    const toc = document.querySelector('.md-nav--secondary');
    if (toc) {
        // Add expand/collapse functionality
        const tocItems = toc.querySelectorAll('.md-nav__item');
        tocItems.forEach(item => {
            const link = item.querySelector('.md-nav__link');
            if (link) {
                link.addEventListener('click', function() {
                    // Highlight current section
                    tocItems.forEach(i => i.classList.remove('active'));
                    item.classList.add('active');
                });
            }
        });
    }
}

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    // Ctrl/Cmd + P for print
    if ((e.ctrlKey || e.metaKey) && e.key === 'p') {
        e.preventDefault();
        window.print();
    }
    
    // Ctrl/Cmd + F for search
    if ((e.ctrlKey || e.metaKey) && e.key === 'f') {
        const searchInput = document.querySelector('.md-search__input');
        if (searchInput) {
            setTimeout(() => searchInput.focus(), 100);
        }
    }
});

// Analytics and user behavior tracking (privacy-friendly)
function trackUserBehavior() {
    // Track reading progress
    let maxScroll = 0;
    window.addEventListener('scroll', function() {
        const scrollPercent = (window.pageYOffset / (document.body.scrollHeight - window.innerHeight)) * 100;
        if (scrollPercent > maxScroll) {
            maxScroll = scrollPercent;
            // Store in localStorage for privacy
            localStorage.setItem('readingProgress_' + window.location.pathname, maxScroll);
        }
    });
    
    // Track time spent on page
    const startTime = Date.now();
    window.addEventListener('beforeunload', function() {
        const timeSpent = Date.now() - startTime;
        localStorage.setItem('timeSpent_' + window.location.pathname, timeSpent);
    });
}

// Initialize user behavior tracking
trackUserBehavior();