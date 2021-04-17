# sphinx-latexpdf

sphinx-doc plus texlive

NOTE: There is also an official sphinx-latexpdf docker: `sphinxdoc/sphinx-latexpdf`.
This is an attempt to make a smaller docker. Note that Texlive is installed "raw", rather than using Ubuntu packages, to give finer control.

## TexLive Configuration

The TexLive configuration for Sphinx-Latexpdf is taken from https://gist.github.com/seisman/ad00252a9f03fc644146a11e6983d9c5#file-install-tl-sh :

```bash
#!/bin/bash

REMOTE="http://mirror.ctan.org/systems/texlive/tlnet"

mkdir -p /tmp/install-texlive
cd /tmp/install-texlive/

curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xz -C ./ --strip-components=1

cat << EOF > texlive.profile
selected_scheme scheme-basic
TEXMFHOME ~/.texmf
collection-basic 1
collection-fontsrecommended 1
collection-langchinese 1
collection-latex 1
collection-latexrecommended 1
collection-xetex 1
option_doc 0
option_src 0
EOF

PLATFORM=`./install-tl --print-platform`
TEXLIVE=$(./install-tl --version | egrep -o "20..")
TEXBIN="/usr/local/texlive/${TEXLIVE}/bin/${PLATFORM}"
./install-tl -q -profile texlive.profile -repository $REMOTE

echo PATH=$PATH:$TEXBIN
echo 'export PATH=$PATH':$TEXBIN >> ~/.bash_profile
$TEXBIN/tlmgr install tabulary latexmk ulem environ trimspaces titlesec \
                      varwidth framed threeparttable wrapfig upquote capt-of \
                      multirow eqparbox needspace fncychap
```

The packages installed are defined in texlive/texlive.profile and additional packages are installed with the Dockerfile using tlmgr.

If additional packages are needed for a given document, these can be installed by running:

```bash
tlmgr install $packagename
```

## Sphinx Configuration

The Ubuntu package `python3-sphinx` is very old, so Sphinx is installed using python `pip` to get the latest version.

## svg Image Support

Sphinx and Latex do not support svg files by default, but the `pip` package `sphinxcontrib-svg2pdfconverter` is installed, together with `inkscape` to allow for easy integration of svg images into the final pdf.

See https://pypi.org/project/sphinxcontrib-svg2pdfconverter/

Modify `conf.py` as follows:

```python
extensions = ['sphinxcontrib.inkscapeconverter']
```

The image can then be added to the reStructuredText as follows:

```rst
.. image:: image.svg
```

## Tags

### 1.0

- Based on Ubuntu 20.04 LTS image
- The Ubuntu package `python3-sphinx` is installed
- Texlive is installed from scratch (not using the Ubuntu package)

This version can compile the Sphinx quickstart project to pdf.

### 2.0

- Based on Ubuntu 20.04 LTS image
- Sphinx is installed from the python `pip` repository (not using the Ubuntu package)
- Texlive is installed from scratch (not using the Ubuntu package)
- `inkscape` is installed for svg support

This version can compile the sample test project (including an svg image) to pdf.