FROM python:3.12.1-slim

ENV GOOGLE_APPLICATION_CREDENTIALS 'local/gsa/alicorp-pe-es-gsa.json'
ENV PIP_DEFAULT_TIMEOUT 100
ENV PIP_DISABLE_PIP_VERSION_CHECK 'on'
ENV PIP_NO_CACHE_DIR 'on'
ENV PYTHON_ENV 'local'
ENV TZ 'America/Lima'
ENV PYTHONDONTWRITEBYTECODE 1

RUN \
	ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install locales-all -y && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN \
	pip install pip==20.1.1 && \
	pip install -r requirements.txt

CMD python main.py

