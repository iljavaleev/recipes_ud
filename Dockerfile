FROM python:3.9-slim

LABEL maintainer='iljavaleev'

ENV PYTHONUNBUFFERED 1



COPY ./app /app
COPY ./requirements.txt /app
COPY ./requirements.dev.txt /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN pip install -r requirements.txt && \
    if [ $DEV = "true" ]; \
        then pip install -r requirements.dev.txt; \
    fi

CMD ["run.sh"]