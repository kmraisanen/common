\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{poetrycollection}
    [2022/01/24 Style for novels based on book]

%%%%%% <OPTIONS>
\DeclareOption{draft}{\def\isdraft{isdraft}}
\ProcessOptions\relax
%%%%%% </OPTIONS>

%%%%%% <PARENT-CLASS>
\LoadClass[]{novel}

\RequirePackage{poetry}
\makeatletter
\@openrightfalse
\makeatother

\renewcommand{\thechapter}{\arabic{chapter}}
\setlength{\cftbeforechapskip}{1mm}
\renewcommand{\cftdot}{{\tiny.}}
%\renewcommand{\cftchapdotsep}{\cftnodots}
\renewcommand{\tocchaptertitlestyle}{%
    \sfmdseries\fontsizetocsection%
}
\renewcommand{\tocchapternumberstyle}{%
    \tocchaptertitlestyle%
}
\setcounter{tocdepth}{0}

\newlength{\poemtitleindentwd}
\newlength{\poemhhinwd}

\newcommand{\hhin}{\hspace*{\poemhhinwd}}

\newcommand{\poemsectiontitle}[2][\fontsizepart]{%
    \clearpage
    \chapter*{#2}
	\addcontentsline{toc}{chapter}{#2}
 	\poemgroup
}
\newcommand{\poemsection}[1]{%
	\poemsectiontitle{#1}
	\vfill
}
\newcommand{\poemsectionsingle}[1]{%
	\poemsectiontitle{#1}%
}
\newcommand{\poemsectionsingleuntitled}{%
}
\newcommand{\poemtitle}[1]{%
	\titlepoem{#1}%
	\addcontentsline{toc}{section}{#1}
	%\addtolop{\thepoemtitle}
}
\newcommand{\poemtitlenum}{%
	\poemtitle{\roman{poemno}}
}
\newcommand{\poemasterisks}{%
\\!
		\begin{center}\fontsizesection\sfupseries
			\textasteriskcentered%
			\hspace{2mm}%
			\textasteriskcentered%
			\hspace{2mm}%
			\textasteriskcentered%
		\end{center}
\\!
}

\newcommand{\quotesource}[2][]{
	\begin{flushright}
		\emph{#2}\\*
		#1
	\end{flushright}
}
\newenvironment{rightquote}{
	\begin{flushright}
	\begin{minipage}[e]{0.7\textwidth}\footnotesize
}{
	\end{minipage}
	\end{flushright}
}
\newenvironment{centerquote}{
	\vspace*{\stretch{.025}}
	\begin{raggedright}
	\begin{minipage}[e]{0.8\textwidth}
}{
	\end{minipage}
	\end{raggedright}
}

%%
%% poetry
%\@dottedtocline{1}{0em}{2.3em}
\def\poemtitlestyle{\bfseries\itshape\fontsizesection}
\def\poemgrouptitleprehook{}
\def\poemgrouptitleposthook{}
\def\poemgroupotherprehook{}
\def\poemgroupotherposthook{}
\def\poemtitleprehook{\hspace*{15mm}}
\def\poemtitleposthook{\\\vskip.5\baselineskip}

\setlength{\poemhinwd}{1.6em}
\setlength{\poemhhinwd}{3.2em}
\setlength{\poemtitleindentwd}{2.4em}
\poemlinenumsfalse

\renewcommand{\fontsizepart}{\changefontsize{14pt}}
\renewcommand{\fontsizechapter}{\changefontsize{12pt}}
\renewcommand{\fontsizesection}{\changefontsize{10pt}}
\renewcommand{\fontsizebody}{\changefontsize{10pt}}

\renewcommand{\fontsizetocpart}{\changefontsize{12pt}}
\renewcommand{\fontsizetocchapter}{\changefontsize{10.5pt}}
\renewcommand{\fontsizetocsection}{\changefontsize{9.5pt}}
\renewcommand{\fontsizehf}{\changefontsize{7.5pt}}

\newcommand{\nl}{%
    \\\nopagebreak%
}