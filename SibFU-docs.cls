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

% -------------------- исправление переполнения строк --------------------
% пакет microtype для улучшения переносов и выравнивания
\RequirePackage{microtype}

% пакет xurl для корректных переносов URL
\RequirePackage{xurl}

% глобальные настройки переносов
\tolerance=1000              % допуск к "плохим" строкам
\emergencystretch=3em        % дополнительное растяжение
\hfuzz=0.5pt                 % допустимое выступание

% biblatex с правильной конфигурацией для русского языка
\RequirePackage{csquotes}
\RequirePackage[
    style=gost-numeric,
    backend=biber,
    sorting=none,
    autolang=other,
    language=auto,
    maxnames=3,           % показывать до 3 авторов
    minnames=1,           % минимум 1 автор перед [и др.]
    movenames=false,      % не переносить авторов
    url=true,             % показывать URL
    doi=true,             % показывать DOI
    eprint=false          % не показывать eprint
]{biblatex}


% -------------------- настройки библиографии --------------------
\DeclareFieldFormat{labelnumberwidth}{#1.}

% Настройка отступов в библиографии (абзацный отступ 12.5mm)
\setlength{\bibhang}{0pt}           % убираем висячий отступ
\setlength{\biblabelsep}{0.5em}     % отступ между номером и текстом
\setlength{\bibitemsep}{0pt}        % интервал между записями
\setlength{\bibnamesep}{0pt}        % интервал между авторами
\setlength{\bibinitsep}{0pt}        % интервал между инициалами

% формат для электронных ресурсов
\DeclareFieldFormat{url}{\mkbibacro{URL}\addcolon\space\url{#1}}
\DeclareFieldFormat{urldate}{(дата обращения\addcolon\space#1)}

% формат для [Электронный ресурс]
\DefineBibliographyStrings{russian}{%
    urlfrom = {Режим доступа},
    urlseen = {дата обращения},
    mathesis = {магистерская диссертация},
    phdthesis = {кандидатская диссертация},
}

% переопределяем вывод URL для соответствия ГОСТ
\DeclareFieldFormat{url}{%
    [Электронный ресурс]. -- Режим доступа\addcolon\space\url{#1}%
}

% настройка нумерации - каждая запись с новой строки с абзацным отступом
\defbibenvironment{bibliography}
  {\list
     {\printtext[labelnumberwidth]{%
        \printfield{labelprefix}%
        \printfield{labelnumber}}}
     {\setlength{\labelwidth}{\labelnumberwidth}%
      \setlength{\leftmargin}{\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}%
      \setlength{\itemindent}{\parindent}%  % абзацный отступ
      \addtolength{\leftmargin}{-\leftmargin}% сброс левого отступа
      \addtolength{\itemindent}{\labelwidth}%
      \addtolength{\itemindent}{\labelsep}}}
  {\endlist}
  {\item}


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
\cftsetindents{subsubsection}{2.6em}{2.3em}

% убрать жирность названий в секциях содержания
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsubsecfont}{\normalfont}

% ширина поля номера страницы и правый отступ
\cftsetpnumwidth{2em}

% -------------------- список литературы --------------------
\defbibheading{bibliography}[{\bibname}]{%
    \section*{\begin{center}\MakeUppercase{Список использованных источников}\end{center}}%
    \vspace*{-2.3em}
    \addcontentsline{toc}{section}{Список использованных источников}%
}
