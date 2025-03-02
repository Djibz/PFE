\LoadClass[a4paper]{report} % Classe du document
\RequirePackage[a4paper, left=2.5cm,right=2.5cm,top=2cm,bottom=3.5cm]{geometry}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

\usepackage{natbib}
\usepackage{svg}

\RequirePackage[french]{babel} % Langue du document

% Links (summary)
\usepackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

%Graphics
\usepackage{graphicx} % Required for inserting images
\usepackage{eso-pic,graphicx}

% FONTS
% \usepackage{tgheros}
\renewcommand{\familydefault}{\sfdefault}

\usepackage{authblk}
\setlength{\affilsep}{1pt} %sep entre noms et affil

\newcommand{\setStyle}{
    \AddToShipoutPictureBG{\includesvg[width=8cm]{images/dashes.svg}}
}

% First page
\newcommand{\frontPage}{
    % \maketitle
    \makeatletter

    \begin{titlepage}
        \AddToShipoutPictureBG*{\includesvg[width=12cm]{images/dashes.svg}}
        \centering
        \includegraphics[width=0.3\textwidth]{images/logos/polytech.png}\hfill
        \includegraphics[width=0.3\textwidth]{images/logos/polytech.png}\hfill
        \includegraphics[width=0.3\textwidth]{images/logos/polytech.png}\vspace{3cm}



        {\scshape\LARGE Ecole Polytechnique de l'Université de Nantes\par}\vspace{1.5cm}
        {\scshape\Large Projet de fin d'étude\par}\vspace{1.5cm}

        {\huge\bfseries \@title \par}\vspace{1cm}
        \renewcommand\Authfont{\fontsize{16}{14.4}\selectfont}
        \renewcommand\Affilfont{\fontsize{10}{10.8}\itshape}
        {\@author}\vspace{2cm}

        \begin{minipage}{0.5\textwidth} % Minipage pour faire deux colonnes
            \begin{flushleft} \large % Envoyer à gauche
                \textbf{Tuteur Industriel :} \par
                LAGADEC Yannick\par
            \end{flushleft}
        \end{minipage}
        ~
        \begin{minipage}{0.4\textwidth}
            \begin{flushright} \large
                \textbf{Référent Apprentissage :} \par
                ROYER Jean-Pierre \par
            \end{flushright}
        \end{minipage}
        ~
        \par
        \vspace{0.5cm}
        \begin{minipage}{0.4\textwidth}
            \begin{center} \large
                \textbf{Tutrice pédagogique :}\par % Pour le titre au dessus des noms à gauche
                EL-MAZOURI Fatima-Zara\par % Remplacer pour chacun
            \end{center}
        \end{minipage}

    \end{titlepage}
}

\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{43pt}
\fancyhead[L]{\raisebox{-0.5\height}{\includegraphics[width=0.3\textwidth]{images/logos/polytech.png}}}
\fancyhead[R]{\thepage}
\fancyfoot[L]{
    {\scriptsize Groupe Softway Medical\par
            29 Allée Saint-Jean, ARTEPARC, Bâtiment D\par
            13710 FUVEAU, France\par
            Tel. +33 (0)4 88 71 13 00\par}
}
\fancyfoot[R]{
    {
            \scriptsize Xtrem Santé\par
            ZI des 4 Chevaliers, Bât 4, 17180 PERIGNY, France | Tel. +33 (0)5 46 43 46 19\par
            SIREN : 479 771 040 | SIRET : 47977104000041\par
            Code APE : 6202A | N° TVA Intra : FR69479771040\par
        }
}
