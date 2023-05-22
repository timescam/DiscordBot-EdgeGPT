FROM python:alpine
WORKDIR /bot
COPY requirements.txt /bot/
RUN pip install -r requirements.txt
COPY . /bot
COPY example.env .env
ARG DISCORD_BOT_TOKEN
RUN sed -i "s/DISCORD_BOT_TOKEN=/DISCORD_BOT_TOKEN=${DISCORD_BOT_TOKEN}/g" .env
ARG COOKIE_FILE
RUN rm -f cookies.json
RUN wget $COOKIE_FILE
CMD python bot.py
