% класс документов для рефератов

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SibFU-docs}
\LoadClass[14pt,a4paper]{extarticle}

% подключаем все необходимые пакеты
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage[T2A]{fontenc}
\RequirePackage{geometry} % макет и оформление по СТУ
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{newtxmath}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{fancyhdr}
\RequirePackage{csquotes}

% biblatex с правильной конфигурацией для русского языка
\RequirePackage{csquotes}
\RequirePackage[
    style=gost-numeric,
    backend=biber,
    sorting=none,
    autolang=other,
    language=auto
]{biblatex}

% настройка полей страницы по СТУ
\geometry{
    left=30mm,
    right=10mm,
    top=20mm,
    bottom=20mm,
    headsep=10mm,
    bindingoffset=0mm
}

% настройка межстрочного интервала (1.5)
\onehalfspacing

% настройка абзацного отступа
\setlength{\parindent}{12.5mm}

% настройка заголовков
\titleformat{\section}
    {\normalfont\normalsize\bfseries}{\thesection.}{1em}{}
\titleformat{\subsection}
    {\normalfont\normalsize\bfseries}{\thesubsection.}{1em}{}

% нумерация страниц
\pagenumbering{arabic}
\pagestyle{plain}

% определяем удобную команду с 5 аргументами
\newcommand{\mycovertitle}[5]{%
\begin{titlepage}
\thispagestyle{empty}
\begin{center}
Министерство науки и высшего образования РФ\\
Федеральное государственное автономное\\
образовательное учреждение высшего образования\\
{\textbf{«СИБИРСКИЙ ФЕДЕРАЛЬНЫЙ УНИВЕРСИТЕТ»}}\\[1ex]
#1\\ % институт, один из аргументов для макроса в тех файле
#2\\ % кафедра

\vfill

\textbf{РЕФЕРАТ}\\
\vspace{1cm}

\begin{minipage}{0.95\textwidth}
\centering #3
\end{minipage}

\vspace{2cm}

\begin{tabular}{@{}ll}
Направление подготовки: \hspace{0.5cm} 09.03.03 \hspace{0.7cm} Прикладная информатика\\[1.5ex]
Наименование программы: \hspace{0.2cm} 09.03.03.35 \hspace{0.07cm} Прикладная информатика\\ \hspace{9.1cm} в искусстве и интерактивных медиа\\[6ex]
Руководитель \hspace{5cm} #4\\[2ex]
Подготовили семинар:\\[1ex]
студенты группы ГФ25-02Б\\[2ex]
#5
\end{tabular}

\vfill

Красноярск \the\year
\end{center}
\end{titlepage}
\clearpage
}


% ------------------ содержание (оформление через tocloft) ------------------
% отступы между секциями
\setlength{\cftbeforesecskip}{-3pt}

% уменьшить вертикальный промежуток вокруг заголовка оглавления
\setlength{\cftbeforetoctitleskip}{20pt}
\setlength{\cftaftertoctitleskip}{-6pt}

% точки-лидеры для всех уровней
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

% расстояние между точками
\renewcommand{\cftdotsep}{1}

% отступы и ширины: первая длина — отступ метки (номер секции), вторая — ширина номера страницы
\cftsetindents{section}{0em}{1em}
\cftsetindents{subsection}{1em}{1.5em}

% убрать жирность названий в секциях содержания
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}

% ширина поля номера страницы и правый отступ
\cftsetpnumwidth{2em}

% -------------------- список литературы --------------------
\defbibheading{bibliography}[\bibname]{%
    \section*{Список использованных источников}%
    \addcontentsline{toc}{section}{Список использованных источников}%
}
