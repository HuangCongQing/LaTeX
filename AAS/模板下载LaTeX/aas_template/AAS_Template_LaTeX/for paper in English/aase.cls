%%
%%
%%  作者： 自动化所自由软件协会 尚书林 左年明
%%
%% Copyright (C) 2006 by SHANG Shulin<shangsl@gmail.com>， 
%%                       ZUO Nianming<nianming@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%%  
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aase}[2006/04/24 v0.3 AAS LaTeX English template class] % Need to be changed with new release
%
\LoadClass[a4paper, 10pt,twocolumn,twoside,final]{article}
\RequirePackage{ifthen}
\usepackage{flushend}
\RequirePackage{picins}
\RequirePackage{ccaption}
\RequirePackage{calc}
%
%
%%--------PAGE FORMAT---------%%
\setlength{\topmargin}{0pt}
\setlength{\headsep}{10pt}  % 页眉底 与正文上面之间的距离
\setlength{\headheight}{6mm}
\setlength{\oddsidemargin}{-7mm}
\setlength{\evensidemargin}{-7mm}
\setlength{\voffset}{-0.40in}   % one inch + \voffset 页眉顶到页顶的距离
\setlength{\hoffset}{0mm}
\setlength{\footskip}{3.5em}
\setlength{\columnsep}{6mm} % 设置两栏之间的间距

\textwidth \paperwidth%
\textheight \paperheight%
\addtolength\textwidth{-38mm} 
\addtolength\textheight{-62mm} 
% extra vertical space between paragraphs normally
\setlength{\parskip}{0mm}
% extra vertical space between paragraphs within a list item
%\setlength{\parsep}{0mm}

%% 下面两条命令设定displaymath与上下文的间距
\setlength{\abovedisplayskip}{8pt plus 2pt minus 2.5pt}
\setlength{\belowdisplayskip}{8pt plus 2pt minus 2.5pt}

\setlength{\doublerulesep}{0.5pt}

%% 行距
\renewcommand{\baselinestretch}{1.05} % 1.22 --- 1.25倍行距
\renewcommand{\arraystretch}{1.06}
%
%
\newlength\aas@linespace
\newcommand{\aas@choosefont}[3]{%
   \setlength{\aas@linespace}{#1*\real{\baselinestretch}}%
   \fontsize{#1}{\aas@linespace plus#2 minus #3}\selectfont}
%
% 参考 thuthesishe和http://bbs.ctex.org/forums/index.php?showtopic=23862
% 1 in = 72 bp = 72.27 pt
% 采用bp符合WORD的大小规范
% 实际TeX采用pt
\newcommand\zihao[1]{%
   \ifthenelse{\equal{#1}{0}}{%
       \aas@choosefont{42bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{0-}}{%
       \aas@choosefont{36bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{1}}{%
       \aas@choosefont{26bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{1-}}{%
       \aas@choosefont{24bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{2}}{%
       \aas@choosefont{22bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{2-}}{%
       \aas@choosefont{18bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{3}}{%
       \aas@choosefont{16bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{3-}}{%
       \aas@choosefont{15bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{4}}{%
       \aas@choosefont{14bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{4-}}{%
       \aas@choosefont{12bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{5}}{%
       \aas@choosefont{10.5bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{5-}}{%
       \aas@choosefont{9bp}{.2pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{6}}{%
       \aas@choosefont{7.5bp}{.2pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{6-}}{%
       \aas@choosefont{6.5bp}{.2pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{7}}{%
       \aas@choosefont{5.5bp}{.1pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{8}}{%
       \aas@choosefont{5bp}{.1pt}{.1pt}}{}}
%
%%----- Redefine \tiny \scriptsize \footnotesize\small ----------%%
%%-------------------------\normalsize --------------------------%%
%%---------------\large \Large \LARGE \huge \Huge ---------------%%
%% Refer to ctex
\def\tiny{\zihao{7-}}
\def\scriptsize{\zihao{7}}
\def\footnotesize{\zihao{6-}}
\def\small{\zihao{6}}
\def\normalsize{\zihao{5-}}%
\def\large{\zihao{5}}%
\def\Large{\zihao{4}}%
\def\LARGE{\zihao{3}}%
\def\huge{\zihao{2-}}%
\def\Huge{\zihao{1-}}%
\normalsize % make \baselinestretch take affect
% 改文献的序号[1]为 1
\renewcommand{\@biblabel}[1]{#1}
% 使整篇文章的首段都有缩进
\let\@afterindentfalse\@afterindenttrue\@afterindenttrue
% 参考文献号上标显示
\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa, #2\fi}]}}
%
% 两脚注间的竖直距离
\setlength{\footnotesep}{0pt}
% 重新定义 脚注条
\def\footnoterule{\kern-3\p@ \hrule width .7\columnwidth height 0.4pt \kern 2.6\p@}
%
%%-------- maketitle --------%%
%
%
\renewcommand{\title}[1]{\gdef\aas@title{{\huge\bf #1}}}
\renewcommand{\author}[1]{\gdef\aas@author{{\normalsize #1}}}
\newcommand{\address}[1]{\gdef\aas@address{{\footnotesize\it#1}}}
\newcommand{\email}[1]{\gdef\aas@email{{\centering\footnotesize (E-mail: #1)}}}
\renewcommand{\abstract}[1]{\gdef\aas@abstract{{\noindent\small {\bf Abstract}\quad #1}}}
\newcommand{\keyword}[1]{\gdef\aas@keyword{{\noindent\small {\bf Key words}\quad #1}}}
\newcommand{\doi}[1]{\gdef\aas@doi{{\noindent\small {\bf DOI}\quad #1}}}
\newcommand{\cit}[1]{\gdef\aas@cit{{\noindent\small {\bf Citation}\quad #1}}}
%
%
\renewcommand{\maketitle}{\par
 \begingroup
  \def\thefootnote{}%  the \thanks{} mark type is empty
  \def\footnotemark{}% and kill space from \thanks within author
   \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
   \long\def\@makefntext##1{\parindent 1em\noindent
           \hb@xt@0.5em{%
               \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
   \twocolumn[\@maketitle]%
   \thispagestyle{aas@firstheadings}%ssl
   \@thanks%
 \endgroup%
 \setcounter{footnote}{0}%
 \global\let\thanks\relax%
 \global\let\maketitle\relax%
 \global\let\@maketitle\relax%
 \global\let\@thanks\@empty%
 \global\let\@author\@empty%
 \global\let\@title\@empty%
 \global\let\title\relax%
 \global\let\author\relax%
 \global\let\and\relax%
%
 \global\let\cncl\relax%
 \global\let\email\relax%
%
 \global\let\aas@title\relax%
 \global\let\aas@author\relax%
 \global\let\aas@address\relax%
 \global\let\aas@abstract\relax%
 \global\let\aas@keyword\relax%
 \global\let\aas@doi\relax%
 \global\let\aas@cit\relax%
%
 \global\let\title\relax%
 \global\let\author\relax%
 \global\let\address\relax%
 \global\let\abstract\relax%
 \global\let\keyword\relax%
 \global\let\doi\relax%
 \global\let\cit\relax%
}
%
\def\@maketitle{%
    \let\footnote\thanks%
    \newpage\null% an empty hbox
    \vskip 1.2\baselineskip%
    {\centering%
    {\aas@title\par}%
    {%\vskip 1.2em%
    \vskip 0.8\baselineskip%
    \begin{tabular}[t]{c}%
    \aas@author%
    \end{tabular}%
    \vskip 0.3em%
    \par%
    }%
    \vskip 0.2\baselineskip}%
    {\linespread{1.0}\selectfont\aas@abstract\par%
    \vskip 0.2\baselineskip%
    \aas@keyword\par%
    \vskip 0.2\baselineskip%
    \aas@cit\par
    \vskip 0.2\baselineskip%
    \aas@doi\par
    }%
    \vskip 1.5\baselineskip%
}
%
\renewcommand{\refname}{\centering \normalsize\bf References}
%\renewcommand{\figurename}{图}
%\renewcommand{\tablename}{表}
%
\newenvironment{acknowledgement}{
    \vspace*{10pt}
    {\noindent\zihao{4}\bfseries Acknowledgements\par}
    \vspace*{10pt}
    \begingroup
    }{
    \par
    \endgroup
}
%
%%---------------- Define biography ----------------%%
\newenvironment{biography}[1][]{
\vskip 0.4\baselineskip%
\zihao{6}
\parpic{%
\includegraphics[height=3.0cm,width=2.4cm, keepaspectratio]{#1}}%
}{\vskip 0.4\baselineskip\par}
%
%% For author who has no photo
\newenvironment{biographynophoto}{\vskip 0.4\baselineskip\zihao{6}}{\vskip 0.4\baselineskip\par}

%%---------------- Redefine section -----------------%%
\setcounter{secnumdepth}{3}

\renewcommand\thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.5ex \@plus -.2ex \@minus -.2ex}%
                                   {1.5ex \@plus.2ex}%
                                   {\zihao{4-}\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.0ex \@plus -.2ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%                
                                     {\zihao{5-}\bfseries}}
 
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-0.5ex \@plus -.2ex \@minus -.2ex}%
                                     {0.5ex \@plus .2ex}%                
                                     {\normalsize\bfseries}}

\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%
\newcommand{\firstheadname}[1]{\gdef\aas@firstheadname{\zihao{5-} #1}}
\newcommand{\firstfootname}[1]{\gdef\aas@firstfootname{#1}}
\newcommand{\headevenname}[1]{\gdef\aas@headevenname{{\zihao{5-} #1}}}
\newcommand{\headoddname}[1]{\gdef\aas@headoddname{{\zihao{5-} #1}}}
%%------------------aas@firstheadings begin------------------------------------%%
\def\ps@aas@firstheadings{
   \let\@evenhead\@empty\let\@evenfoot\@empty
   \let\@oddhead\@empty\let\@oddfoot\@empty
    \def\@evenhead{%
        \vbox{%
            \vskip 3.2mm%
            \hbox to \textwidth{{\zihao{5-} Vol.\hskip 0.18em XX,\ No.\hskip 0.18em X}\hfill \hbox{\aas@firstheadname} \hfill {\zihao{5-} Month,\ 201X}}%
            \vskip 2.0mm%
            \hrule width\textwidth height0.63pt\vskip0.85pt \hrule width\textwidth height0.63pt%
        }%
    }
   \def\@evenfoot{
   \hbox{\aas@firstfootname}
    }
   \let\@oddhead\@evenhead%
   \let\@oddfoot\@evenfoot%
}
%%-----------------aas@firstheadings end--------------------------------------%%
%%-------------------aasheadings begin----------------------------------------%%
\def\ps@aasheadings{
    \let\@evenhead\@empty\let\@evenfoot\@empty
    \let\@oddhead\@empty\let\@oddfoot\@empty
    \def\@evenhead{%
        \vbox{%
            \vskip 3.2mm%
            \hbox to \textwidth {{\zihao{5-} \thepage} \hfill \hbox{\aas@headevenname} \hfill {\zihao{5-} Vol.\hskip 0.18em XX}}%
            \vskip 2.0mm%
            \hbox to \textwidth{\noindent\rule[2mm]{\textwidth}{0.5pt}}%
        }%
    }
    \def\@oddhead{%
        \vbox{%
            \vskip 3.2mm%
            \hbox to \textwidth {{\zihao{5-} No.\hskip 0.18em X}\hfill{\aas@headoddname}\hfill {\zihao{5-} \thepage}}%
            \vskip 2.0mm%
            \hbox to \textwidth{\noindent\rule[2mm]{\textwidth}{0.5pt}}%  
        }
    }%
}
%---------------------headings end------------------------------------------%%
%
%%-------- Set the begin and end method for class -----%%
\AtBeginDocument{%
   \flushend
   \captiondelim{ } % 把图标题中缺省的分隔符 ``:''改为空
   \captionnamefont{\small}%
   \captiontitlefont{\small}%
   }
\AtEndDocument{\clearpage}

\endinput
%%-------- The end of aas.cls -------------%%
