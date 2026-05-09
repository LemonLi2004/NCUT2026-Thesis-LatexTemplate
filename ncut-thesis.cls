% ncut-thesis.cls
% 北方工业大学本科毕业设计论文 LaTeX 模板类文件
% 根据《2025届北方工业大学本科毕业论文模板》排版要求制作

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ncut-thesis}[2025/01/14 NCUT Undergraduate Thesis Template]

% 基于 ctexbook 类
\LoadClass[a4paper, zihao=-4, linespread=1.5, oneside, openany]{ctexbook}

%% ==================== 宏包加载 ====================
\RequirePackage{geometry}       % 页面布局
\RequirePackage{fancyhdr}       % 页眉页脚
\RequirePackage{titlesec}       % 标题格式
\RequirePackage{titletoc}       % 目录格式
\RequirePackage{graphicx}       % 图片
\RequirePackage{booktabs}       % 三线表
\RequirePackage{amsmath}        % 数学公式
\RequirePackage{mathptmx}       % 数学公式使用 Times 字体
\RequirePackage{amssymb}        % 数学符号
\RequirePackage{caption}        % 图表标题
\RequirePackage{subcaption}     % 子图
\RequirePackage{enumitem}       % 列表格式
\RequirePackage{fontspec}       % 字体设置
\RequirePackage{xeCJK}          % 中文支持
\RequirePackage{hyperref}       % 超链接
\RequirePackage{xcolor}         % 颜色
\RequirePackage{listings}       % 代码
\RequirePackage{algorithm2e}    % 算法
\RequirePackage{float}          % 浮动体
\RequirePackage{placeins}       % 浮动体位置控制（提供\FloatBarrier）
\RequirePackage{multirow}       % 多行表格
\RequirePackage{longtable}      % 长表格
\RequirePackage{array}          % 表格增强
\RequirePackage{threeparttable} % 表格注释
\RequirePackage{zhnumber}       % 中文数字
\RequirePackage{pifont}         % 特殊符号
\RequirePackage{etoolbox}       % 编程工具
\RequirePackage{xparse}         % 命令定义
\RequirePackage[normalem]{ulem} % 下划线
\RequirePackage[backend=biber, style=gb7714-2015, gbpub=false]{biblatex} % 参考文献 GB/T 7714-2015
\RequirePackage{pdfpages}      % PDF页面拼接（用于插入封面等外部PDF）

%% ==================== 页面设置 ====================
% A4纸，左边距2.54厘米、右边距1.91厘米、上边距2.54厘米、下边距1.91厘米
% 页眉边距1.5厘米，页脚边距1.75厘米
\geometry{
    a4paper,
    left=2.54cm,
    right=1.91cm,
    top=2.54cm,
    bottom=1.91cm,
    headheight=0.5cm,
    headsep=0.5cm,
    footskip=0.75cm
}

%% ==================== 字体设置 ====================
% 中文字体：宋体、黑体、楷体、仿宋
% 西文字体：Times New Roman

\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

% 中文字体设置
\setCJKmainfont[BoldFont=Heiti SC, ItalicFont=Kaiti SC]{Songti SC}
\setCJKsansfont{Heiti SC}
\setCJKmonofont{STFangsong}

% 定义字体命令（ctex已定义，此处重新指定字体）
\renewcommand{\songti}{\CJKfontspec{Songti SC}}
\renewcommand{\heiti}{\CJKfontspec{Heiti SC}}
\renewcommand{\kaishu}{\CJKfontspec{Kaiti SC}}
\renewcommand{\fangsong}{\CJKfontspec{STFangsong}}

% 字号定义 (pt)
% 二号 = 22pt, 三号 = 16pt, 四号 = 14pt, 小四 = 12pt, 五号 = 10.5pt, 小五 = 9pt
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}

%% ==================== 页眉页脚 ====================
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[C]{\xiaowu\songti 北方工业大学本科生学士学位论文（毕业设计）}
    \fancyfoot[C]{\wuhao\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 前置部分页面样式（罗马数字页码）
\fancypagestyle{frontmatter}{
    \fancyhf{}
    \fancyfoot[C]{\wuhao\Roman{page}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 正文部分页面样式
\fancypagestyle{mainmatter}{
    \fancyhf{}
    \fancyhead[C]{\xiaowu\songti 北方工业大学本科生学士学位论文（毕业设计）}
    \fancyfoot[C]{\wuhao\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0pt}
}

%% ==================== 章节标题格式 ====================
% 一级标题：黑体，三号，左对齐，1.5倍行距
\ctexset{
    chapter = {
        format = {\heiti\sanhao\raggedright},
        name = {,},
        number = \arabic{chapter},
        aftername = \hspace{1em},
        beforeskip = 0pt,
        afterskip = 0pt,
        pagestyle = mainmatter
    },
    section = {
        format = {\heiti\sihao\raggedright},
        aftername = \hspace{1em},
        beforeskip = 0pt,
        afterskip = 0pt
    },
    subsection = {
        format = {\heiti\sihao\raggedright},
        aftername = \hspace{1em},
        beforeskip = 0pt,
        afterskip = 0pt
    }
}

%% ==================== 目录格式 ====================
% 目录标题：黑体小四号居中（不使用 chapter* 的三号格式）
\renewcommand{\contentsname}{}
\renewcommand{\tableofcontents}{
    \clearpage
    \thispagestyle{frontmatter}
    \begin{center}
        {\heiti\xiaosi 目\hspace{1em}录\par}
    \end{center}
    \vspace{0.5\baselineskip}
    \@starttoc{toc}
}

% 目录项格式：宋体小四号，显示到3级
\titlecontents{chapter}[0pt]
    {\xiaosi\songti}
    {\thecontentslabel\hspace{1em}}
    {}
    {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{section}[1em]
    {\xiaosi\songti}
    {\thecontentslabel\hspace{1em}}
    {}
    {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}[2em]
    {\xiaosi\songti}
    {\thecontentslabel\hspace{1em}}
    {}
    {\titlerule*[0.5pc]{.}\contentspage}

%% ==================== 图表标题格式 ====================
% 表题：黑体/Times New Roman，五号，居中，段后6磅
\DeclareCaptionFont{tablefont}{\wuhao\heiti}
\captionsetup[table]{
    font = tablefont,
    labelsep = quad,
    skip = 6pt,
    position = above
}

% 图名：黑体/Times New Roman，小五号，居中，段前6磅
\DeclareCaptionFont{figurefont}{\xiaowu\heiti}
\captionsetup[figure]{
    font = figurefont,
    labelsep = quad,
    skip = 6pt,
    position = below
}

% 图表编号格式
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

%% ==================== 公式编号格式 ====================
% 公式分章编号，如 (1.1)

%% ==================== 参考文献格式 ====================
% 参考文献标题：黑体五号居中
\defbibheading{bibintoc}[\bibname]{%
    \clearpage
    \thispagestyle{mainmatter}
    \addcontentsline{toc}{chapter}{参考文献}
    {\centering\heiti\wuhao #1\par}
}
\renewcommand{\bibfont}{\wuhao}

% 参考文献条目缩进设置：悬挂缩进2字符
\setlength{\bibhang}{2\ccwd}

%% ==================== 摘要环境 ====================
% 中文摘要（含中文论文标题）
% 要求：中文标题黑体二号居中，"摘要："黑体小四号左对齐带冒号，内容宋体小四号
\newenvironment{cnabstract}{
    \clearpage
    \thispagestyle{frontmatter}
    \begin{center}
        {\heiti\erhao \@thesistitle\par}
    \end{center}
    \vspace{1\baselineskip}
    \noindent{\CJKfontspec[AutoFakeBold=3]{Heiti SC}\bfseries\xiaosi 摘\hspace{1em}要：}%
    \xiaosi\songti
}{}

% 中文关键词
% 要求：黑体小四号"关键词："，其后宋体小四号，首行缩进2字符，关键词前空一行
\newcommand{\cnkeywords}[1]{
    \vspace{1\baselineskip}
    \noindent{\CJKfontspec[AutoFakeBold=3]{Heiti SC}\bfseries\xiaosi 关键词：}\songti\xiaosi #1
}

% 英文摘要（含英文论文标题）
% 要求：英文标题TNR二号加粗居中，"Abstract:"TNR小四号加粗左对齐带冒号
\newenvironment{enabstract}{
    \clearpage
    \thispagestyle{frontmatter}
    \begin{center}
        {\bfseries\erhao \@thesistitleEN\par}
    \end{center}
    \vspace{1\baselineskip}
    \noindent{\bfseries\xiaosi Abstract:}~%
    \xiaosi
}{}

% 英文关键词
% 要求："Keywords:"TNR小四号加粗，其后TNR小四号，关键词前空一行
\newcommand{\enkeywords}[1]{
    \vspace{1\baselineskip}
    \noindent\textbf{Keywords:} #1
}

%% ==================== 致谢环境 ====================
% 要求：标题黑体三号居中，内容宋体小四号，首行缩进2字符
\newenvironment{acknowledgement}{
    \clearpage
    \thispagestyle{mainmatter}
    \addcontentsline{toc}{chapter}{致谢}
    {\centering\heiti\sanhao 致\hspace{1em}谢\par}
    \xiaosi\songti
}{}

%% ==================== 附录环境 ====================
% 要求：标题黑体三号居中，内容宋体小四号
\renewenvironment{appendix}{
    \clearpage
    \thispagestyle{mainmatter}
    \addcontentsline{toc}{chapter}{附录}
    {\centering\heiti\sanhao 附\hspace{1em}录\par}
    \xiaosi\songti
}{}

%% ==================== 脚注格式 ====================
% 脚注：宋体/Times New Roman，小五号，左对齐，单倍行距
\renewcommand{\footnotesize}{\xiaowu}

%% ==================== 超链接设置 ====================
\hypersetup{
    colorlinks = true,
    linkcolor = black,
    citecolor = black,
    urlcolor = blue,
    bookmarksnumbered = true,
    pdfstartview = FitH
}

%% ==================== 列表格式 ====================
\setlist{noitemsep, topsep=0pt, parsep=0pt}

%% ==================== 代码格式 ====================
\lstset{
    basicstyle = \small\ttfamily,
    keywordstyle = \color{blue},
    commentstyle = \color{gray},
    stringstyle = \color{red},
    numbers = left,
    numberstyle = \tiny\color{gray},
    frame = single,
    breaklines = true,
    captionpos = b,
    tabsize = 4,
    showstringspaces = false
}

% YAML语言定义
\lstdefinelanguage{yaml}{
    keywords={true,false,null,y,n},
    keywordstyle=\color{blue}\bfseries,
    basicstyle=\small\ttfamily,
    sensitive=false,
    comment=[l]{\#},
    morecomment=[s]{/*}{*/},
    commentstyle=\color{gray}\ttfamily,
    stringstyle=\color{red}\ttfamily,
    moredelim=[l][\color{orange}]{\&},
    moredelim=[l][\color{magenta}]{*},
    moredelim=**[il][\color{cyan}\bfseries]{:},
    morestring=[b]',
    morestring=[b]",
}

% Bash语言样式
\lstdefinestyle{bash}{
    language=bash,
    basicstyle=\small\ttfamily,
    keywordstyle=\color{blue}\bfseries,
    stringstyle=\color{red},
    commentstyle=\color{gray},
}

%% ==================== 论文信息命令 ====================
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\thesistitleEN}[1]{\def\@thesistitleEN{#1}}
\newcommand{\studentname}[1]{\def\@studentname{#1}}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\submitdate}[1]{\def\@submitdate{#1}}

%% ==================== 封面相关命令 ====================
\newcommand{\classname}[1]{\def\@classname{#1}}       % 班级
\newcommand{\titlefirstline}[1]{\def\@titlefirstline{#1}}   % 题目第一行
\newcommand{\titlesecondline}[1]{\def\@titlesecondline{#1}} % 题目第二行

% 默认值
\classname{}
\titlefirstline{}
\titlesecondline{}

%% ==================== 封面页 ====================
\newcommand{\makecover}{
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}
            % 校徽和校名
            \vspace*{0.5cm}
            
            % 如果有校徽图片，取消下面注释并确保图片存在
            % \includegraphics[height=2.5cm]{figures/ncut_logo.png}
            % \vspace{0.5cm}
            
            % 校名（如果是图片形式，请替换为 \includegraphics）
            {\heiti\fontsize{26pt}{39pt}\selectfont 北方工业大学}
            
            \vspace{0.8cm}
            
            % 论文类型
            {\heiti\fontsize{22pt}{33pt}\selectfont 本科毕业设计说明书（论文）}
            
            \vspace{3cm}
            
            % 论文题目（下划线形式）
            \renewcommand{\ULthickness}{1pt}
            \renewcommand{\ULdepth}{3pt}
            
            {\heiti\sanhao 题\hspace{1em}目：\uline{\hspace{1em}\@titlefirstline\hspace{1em}}}
            
            \ifx\@titlesecondline\empty
            \else
                \vspace{0.5em}
                {\heiti\sanhao \hspace{4.5em}\uline{\hspace{1em}\@titlesecondline\hspace{1em}}}
            \fi
            
            \vspace{3cm}
            
            % 学生信息表格
            \renewcommand{\arraystretch}{1.8}
            \begin{tabular}{>{\heiti\sihao}r>{\songti\sihao}l}
                学生姓名： & \uline{\makebox[8cm][c]{\@studentname}} \\
                学\hspace{2em}号： & \uline{\makebox[8cm][c]{\@studentid}} \\
                班\hspace{2em}级： & \uline{\makebox[8cm][c]{\@classname}} \\
                院\hspace{2em}系： & \uline{\makebox[8cm][c]{\@department}} \\
                专\hspace{2em}业： & \uline{\makebox[8cm][c]{\@major}} \\
                指导教师： & \uline{\makebox[8cm][c]{\@advisor}} \\
            \end{tabular}
            
            \vfill
            
            % 提交日期
            {\songti\sihao \@submitdate}
            
            \vspace{1cm}
            
        \end{center}
    \end{titlepage}
    \setcounter{page}{1}
}

%% ==================== 英文标题页 ====================
\newcommand{\makeentitlepage}{
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \vspace*{5cm}
        
        {\bfseries\erhao \@thesistitleEN}
        
        \vfill
    \end{center}
}

\endinput
