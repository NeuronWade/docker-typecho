FROM tutum/apache-php

LABEL maintainer="neuronwade <neuronwade@gmail.com>"

RUN apt-get update && apt-get install -yq git && rm -rf /var/lib/apt/lists/*

ENV WEB_GIT_URL https://github.com/typecho/typecho.git
ENV REPOS_TAG v1.1-17.10.30-release

RUN mkdir -p /html && rm -rf /var/www/html && ln -s /html /var/www/html && chown -R www-data:www-data /html/
RUN git clone $WEB_GIT_URL /html
RUN git checkout tags/$REPOS_TAG -b $REPOS_TAG
