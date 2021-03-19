# sphinx

sphinx-doc plus texlive

NOTE: There is also an official sphinx-latexpdf docker: `sphinxdoc/sphinx-latexpdf`.
This is an attempt to make a smaller docker. Note that Texlive is installed "raw", rather than using Ubuntu packages, to give finer control.

## TexLive Configuration

The TexLive configuration for Sphinx-Texliveis taken from https://gist.github.com/seisman/ad00252a9f03fc644146a11e6983d9c5#file-install-tl-sh

The packages installed are defined in texlive/texlive.profile and additional packages are installed with the Dockerfile using tlmgr.

If additional packages are needed for a given document, these can be installed by running:

```bash
tlmgr install $packagename
```
