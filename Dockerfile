FROM python:3

LABEL maintainer="thomas.jaspers@codecentric.de"

#
# Let's make sure we are always having the latest version of pip installed
#
RUN python -m pip install --upgrade pip

#
# Installing the latest robot framework version
#
RUN python3 -m pip install robotframework

#
# Installing selenium2 test library
#
RUN python3 -m pip install robotframework-selenium2library
RUN python3 -m pip install selenium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
        && dpkg -i google-chrome*.deb || true \
        && rm google-chrome*.deb
RUN wget https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_linux64.zip \
        && unzip chromedriver_linux64.zip \
        && rm chromedriver_linux64.zip \
        && mv chromedriver /usr/local/bin \
        && chmod +x /usr/local/bin/chromedriver

CMD ["/scripts/run_suite.sh"]

#CMD ["robot", "/usr/src/project/sample-0-trivial/sample-0-trivial.txt"]