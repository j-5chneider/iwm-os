FROM rocker/binder:4.3.1
LABEL maintainer='Jürgen Schneider'
COPY --chown=${NB_USER} . ${HOME}
USER ${NB_USER}



RUN wget https://github.com/j-5chneider/iwm-os/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2023-10-11/')); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0
