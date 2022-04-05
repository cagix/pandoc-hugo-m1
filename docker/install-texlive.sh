#!/bin/sh

## Download install-tl perl script (cg. https://tug.org/texlive/acquire-netinstall.html)
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz    || exit 1
mkdir -p ./install-tl
tar --strip-components 1 -zvxf install-tl-unx.tar.gz -C "$PWD/install-tl"   || exit 1

## Run the default installation with the our minimal profile
./install-tl/install-tl --profile=/root/texlive.profile

## Cleanup installation artifacts
rm -rf ./install-tl ./install-tl-unx.tar.gz

## Update TeX Live Manager
tlmgr update --self || exit 1

## Install packages needed by Pandoc (cf. https://pandoc.org/MANUAL.html#creating-a-pdf)
tlmgr install amsfonts      \
              amsmath       \
              lm            \
              lm-math       \
              unicode-math  \
              iftex         \
              listings      \
              fancyvrb      \
              tools         \
              booktabs      \
              graphics      \
              hyperref      \
              xcolor        \
              ulem          \
              geometry      \
              setspace      \
              babel         \
              fontspec      \
              selnolig      \
              bidi          \
              mathspec      \
              upquote       \
              microtype     \
              csquotes      \
              natbib        \
              biblatex      \
              bibtex        \
              biber         \
              parskip       \
              xurl          \
              bookmark      \
              footnotehyper \
              oberdiek      || exit 1

## Install extra packages for Beamer/Metropolis
tlmgr install beamertheme-metropolis      \
              pgfopts                     \
              tcolorbox                   \
              environ                     || exit 1

## Install extra packages for LaTeX conversion to .png
tlmgr install standalone    \
              filemod       \
              currfile      \
              mathtools     \
              gincltex      \
              svn-prov      \
              adjustbox     \
              collectbox    || exit 1

# Clean up
rm -rf /opt/texlive/texdir/texmf-dist/doc        \
       /opt/texlive/texdir/readme-html.dir       \
       /opt/texlive/texdir/readme-txt.dir        \
       /opt/texlive/texdir/install-tl*
