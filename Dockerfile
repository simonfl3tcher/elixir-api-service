FROM ubuntu:14.04

# Elixir needs to be compiled against UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Copy ENV from host to container
ENV HOST_VARS inject_here

RUN apt-get update && apt-get install -y \
    curl \
    libfontconfig1 \
    libfontconfig1-dev \
    git \
    wget

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y esl-erlang elixir

WORKDIR /app/user
ADD mix.* ./
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

RUN mix compile && \
    mix phoenix.digest

EXPOSE 4000

CMD mix ecto.migrate && \
    mix phoenix.server
