\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novel}
    [2022/01/24 Style for fiction based on book]

%%%%%% <OPTIONS>
\DeclareOption{draft}{\def\isdraft{isdraft}}
\ProcessOptions\relax
%%%%%% </OPTIONS>

%%%%%% <PARENT-CLASS>
\LoadClass[openright,twoside]{book}
%%%%%% </PARENT-CLASS>
\setlength{\paperheight}{198mm}
\setlength{\paperwidth}{130mm}

%%%%%% <PACKAGES>
\RequirePackage[swedish]{babel}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{fontspec,lipsum}
\RequirePackage{fontsize}
\RequirePackage{framed}
\RequirePackage[
    total={130mm,198mm},%
    inner=10mm,%
    outer=15mm,%
    top=15mm,%
    bottom=20mm%,
]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{setspace}
\RequirePackage{subfiles}
\RequirePackage[titles]{tocloft}
\RequirePackage[small,sf,bf,compact]{titlesec}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{xargs}
\RequirePackage[firstpage=true]{background}
\ifdef\ispoetry{
    \RequirePackage{poetry}
}{}
%%%%%% </PACAKAGES>

%%%%%% <DEFS>
\def\parttitle{Part}
\def\chaptertitle{Chapter}
\def\sectiontitle{Section}
\def\doctitle{}
\def\docsubtitle{}
\def\docauthor{}

\def\themeprimary{DarkGoldenrod}
\def\themesecondary{Goldenrod}
\def\themepage{White}
\def\themetext{Black}
\def\themewarning{Crimson}

\def\themecoverbg{\themeprimary}
\def\themecoverauthor{\themesecondary}
\def\themecovertitle{\themesecondary}
\def\themecoversubtitle{\themesecondary}
\def\themecoverline{\themepage}
\def\themecoverimage{cover}
%%%%%% </DEFS>


%%%%%% <TESTS>
\providebool{isdraft}
\newcommand{\ifnovel}[1]{%
    \ifdef{\isnovel}{#1}{}%
}
\newcommand{\ifnotnovel}[1]{%
    \ifdef{\isnovel}{}{#1}%
}
\newcommand{\ifdraft}[1]{%
	\ifdef{\isdraft}{#1}{}%
}
\newcommand{\ifnotdraft}[1]{%
	\ifdef{\isdraft}{}{#1}%
}
\newcommand{\markdraft}[2][\thedate]{%
	\ifdraft{%
		\marginpar{\color{gray}\tiny#1}
		\emph{\color{lightgray}#2}%
	}%
}
%%%%%% </TESTS>


%%%%%% <COLORS>
\newcommandx\colorrule[2][1=\themeprimary,2=.5cm]{%
	\noindent%
	{\color{#1} \rule{\linewidth}{#2}}
}
\newcommand{\covercolorrule}[1]{%
    \colorrule[\themecoverline][#1]
}
%%%%%% </COLORS>


%%%%%% <FONTS>
\defaultfontfeatures{Ligatures=TeX}
\setromanfont[
Path=fonts/,
ItalicFont=Merriweather-Italic,
BoldFont=Merriweather-Bold,
BoldItalicFont=Merriweather-BoldItalic,
Kerning=On,
]{Merriweather-Regular}

\setsansfont[
Path=fonts/,
BoldFont=PublicSans-Bold,
UprightFont=PublicSans-Light,
ItalicFont=PublicSans-Italic,
Kerning=On,
]{PublicSans-SemiBold}

\newcommand{\sfitshape}{%
\sffamily\itshape%
}
\newcommand{\sfupshape}{%
\sffamily\upshape%
}
\newcommand{\sfbfseries}{%
\sffamily\bfseries%
}
\newcommand{\sfmdseries}{%
\sffamily\mdseries%
}

\newcommand{\sftextup}[1]{%
    {\sfupshape#1}%
}
\newcommand{\sftextbf}[1]{%
    {\sfbfseries#1}%
}
\newcommand{\sftextmd}[1]{%
    {\sfmdseries#1}%
}

\tolerance=500
\newcommand{\fontsizeauthor}{\changefontsize{28pt}}
\newcommand{\fontsizetitle}{\changefontsize{28pt}}
\newcommand{\fontsizesubtitle}{\changefontsize{20pt}}
\newcommand{\fontsizepart}{\changefontsize{18pt}}
\newcommand{\fontsizechapter}{\changefontsize{16pt}}
\newcommand{\fontsizesection}{\changefontsize{12pt}}
\newcommand{\fontsizebody}{\changefontsize{10.5pt}}

\newcommand{\fontsizetocpart}{\changefontsize{16pt}}
\newcommand{\fontsizetocchapter}{\changefontsize{10.5pt}}
\newcommand{\fontsizetocsection}{\changefontsize{9.5pt}}
\newcommand{\fontsizehf}{\changefontsize{9.5pt}}

\newcommand{\fontauthor}{\fontsizeauthor\sfmdseries}
\newcommand{\fontsubtitle}{\fontsizesubtitle\sfupshape}
\newcommand{\fonttitle}{\fontsizetitle\sfbfseries}

\renewcommand{\familydefault}{\rmdefault}

\newcommand{\partnamestyle}{\sfupshape\fontsizepart}
\newcommand{\parttitlestyle}{\sfbfseries\fontsizepart}
\newcommand{\chapternamestyle}{\sfupshape\fontsizechapter}
\newcommand{\chaptertitlestyle}{\sfbfseries\fontsizechapter}

\newcommand{\tocpartnumberstyle}{%
    \sfupshape\fontsizetocpart%
}
\newcommand{\tocparttitlestyle}{%
    \sfbfseries\fontsizetocpart%
}
\newcommand{\tocchapternumberstyle}{%
    \sfupshape\fontsizetocchapter%
}
\newcommand{\tocchaptertitlestyle}{%
    \sfbfseries\fontsizetocchapter%
}
\newcommand{\tocsectionnumberstyle}{%
    \sfupshape\fontsizetocsection%
}
\newcommand{\tocchaptersectionstyle}{%
    \sfitshape\fontsizetocsection%
}
%%%%%% </FONTS>

%%%%%% <TOC>
\addto\captionsswedish{%
  \renewcommand{\contentsname}{Innehåll}%
} 
\renewcommand{\thepart}{\Alph{part}}
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\thesection}{\alph{section}}

\renewcommand{\cfttoctitlefont}{\chaptertitlestyle}

\renewcommand{\cftpartfont}{\tocparttitlestyle}
\renewcommand{\cftpartpagefont}{\tocpartnumberstyle}

\renewcommand{\cftchapfont}{\tocchaptertitlestyle}
\renewcommand{\cftchappagefont}{\tocchapternumberstyle}
\renewcommand{\cftsecfont}{\tocchaptersectionstyle}
\renewcommand{\cftsecpagefont}{\tocsectionnumberstyle}

\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}

\cftpagenumbersoff{part}
\cftpagenumbersoff{section}

\cftsetrmarg{1mm}
\renewcommand\cftpartafterpnum{
    \par
    \vspace*{-.5\baselineskip}%
    \hspace*{-\cftpartnumwidth}%
    \colorrule[\themeprimary][1pt]%
}
\setlength{\cftpartindent}{0pt}
\setlength{\cftpartnumwidth}{10mm}
\setlength{\cftbeforepartskip}{5mm}

\setlength{\cftbeforetoctitleskip}{\cftchapnumwidth}
\setlength{\cftchapindent}{0pt}
\setlength{\cftchapnumwidth}{10mm}
\setlength{\cftbeforechapskip}{5mm}

\setlength{\cftsecindent}{0pt}
\setlength{\cftsecnumwidth}{10mm}

% \setlength{\cftsecindent}{0pt}
% \setlength{\cftsecnumwidth}{0pt}
% \setlength{\cftbeforesecskip}{0pt}
\tocloftpagestyle{plain}

\newcommand{\warningtext}[1]{\textcolor{\themewarning}{#1}}
\newcommand{\precistext}[1]{%
    {\sfitshape\warningtext{#1}}%
}
\makeatletter
\renewcommand{\cftchapterprecishere}[1]{}
\renewcommand{\cftchapterprecistoc}[1]{%
    \addtocontents{toc}{%
        {\leftskip \cftchapindent\relax
         \advance\leftskip \cftchapnumwidth\relax
         \hfill
         \precistext{#1}\protect\par}
    }%
}
\makeatother

\newcommand{\wipchapter}[2][Work in progress]{%
    \chapter{\warningtext{#2}}%
    \cftchapterprecis{#1}
}


\setcounter{tocdepth}{2}
%%%%%% </TOC>


%%%%%% <TITLES>
\newcommand{\parttitlename}{Del}
\renewcommand{\chaptertitlename}{Nr.}

\titleformat{\part}[display]
    {\partnamestyle}
    {%
        \vskip\baselineskip
        \colorrule[\themesecondary][5mm]\\[.5ex]
        \parttitlename\ \thepart%
    }
    {-.8ex}
    {\parttitlestyle}


\titleformat{\chapter}[hang]
    {\chapternamestyle\color{\themeprimary}}
    {\thechapter.}
    {.5ex}{\chaptertitlestyle\color{\themetext}}

\titlespacing*{\part}{0pt}{0pt}{0pt}
\titlespacing*{\chapter}{0pt}{15mm}{.5\baselineskip}

\renewcommand{\chaptermark}[1]{%
    \markboth{#1}{\chaptertitlename\ \thechapter}
}
\renewcommand{\partmark}[1]{%
    \markright{\parttitlename\ \thepart.\ \#1}
}

%%%%%% </TITLES>

%%% META
\graphicspath{ {./images/} }
\backgroundsetup{
scale=1.0,
opacity=1.0,
placement=bottom,
hshift=0mm,
vshift=7mm,
contents={%
    \includegraphics[width=130mm,height=130mm]{\themecoverimage}
}%
}

\makeatletter
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{}
\newcommand*{\thesubtitle}{\@subtitle}
\newcommand*{\thetitle}{\@title}
\makeatother

\newcommand{\nlno}[1][0.5ex]{\\[#1]\noindent}

\makeatletter
\renewcommand\maketitle{
	\pagestyle{empty}%
	\newgeometry{left=7mm,right=0mm,bottom=0mm,top=9mm}%
	\pagecolor{\themecoverbg}%
	\noindent%
	\begin{minipage}[t][50mm]{130mm}\noindent
     	\begin{minipage}[c]{30mm}\raggedright\noindent%
     	    \includegraphics[width=30mm,height=10mm]{colophon}%
     	\end{minipage}
     	\hspace*{10mm}
    	\begin{minipage}[t]{80mm}\raggedright\noindent%
            \hspace*{-.5em}{\fontauthor\textcolor{\themecoverauthor}{\@author}}\nlno
            \hspace*{-.5em}{\fonttitle\textcolor{\themecovertitle}{\@title}}\nlno
            \hspace*{-.5em}{\fontsubtitle\textcolor{\themecoversubtitle}{\@subtitle}}
    	\end{minipage}
    \end{minipage}

	\clearpage
    \nopagecolor
    \pagecolor{\themepage}
	\color{\themetext}
	\restoregeometry
	\cleardoublepage
} % Note the extra }
\makeatother


%%% /META

%%% COMMANDS
\newenvironment{halfbox}{%
	\par\noindent%
	\hspace*{.25\textwidth}%
	\begin{minipage}[t]{0.5\textwidth}\sffamily\small
        \color{\themeprimary}
		\begin{framed}\centering
		}{%
		\end{framed}
	\end{minipage}
	\par\vskip\baselineskip
}

\newcommand{\pb}{%
    \par\vskip\baselineskip\noindent%
}

%%% /COMMANDS

%%% HEADER/FOOTER
    \fancyheadinit{\sfupshape\fontsizehf}
    \fancyfootinit{\sfupshape\fontsizehf}

    \fancypagestyle{fancyplain}{
        \fancyhf{}
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
    }
    
    \fancypagestyle{plain}[fancyplain]{
        \fancyfoot[L]{}
        \fancyfoot[C]{\thepage}
        \fancyfoot[R]{}
    }
    \fancypagestyle{fancytoc}[fancyplain]{}

    \fancypagestyle{fancynormal}[plain]{
        % \renewcommand{\headrulewidth}{1pt}
        % \fancyhead[C]{}
        % \fancyhead[RO,LE]{\textcolor{\themeprimary}{\thechapter.}\ \nouppercase{\leftmark}}
    }
    \hypersetup{colorlinks=false, linktoc=all}
    
%%% DOCUMENT STRUCTURE
\newcommand{\startfrontmatter}{%
    \frontmatter%

    \pagestyle{plain}
}
\newcommand{\startmainmatter}{%
    \mainmatter%

    \pagestyle{fancynormal}
    \fontsizebody
}

\newcommand{\pagequote}[2][]{
    \vspace*{60mm}
    \hfill
    \begin{minipage}[c]{.75\textwidth}
        \begin{raggedright}\large\itshape
            >>#2<<
        \end{raggedright}
        \par\vskip\baselineskip\relax
        \hspace*{15mm}{\large\sfbfseries#1}
    \end{minipage}
    \cleardoublepage
}

\author{\docauthor}
\title{\doctitle}
\subtitle{\docsubtitle}
\date{\the\year}
\hypersetup{
    pdfinfo={
        Author=\docauthor,
        Title=\doctitle -- \docsubtitle,
        Subject=Short\ stories,
        % ...
    },
    colorlinks=false,
    linktoc=all,
    colorlinks=true,
    linkcolor=black,
}
\spacing{1.4}
%%%% / DOCUMENT STRUCTURE

