# Use elixir base image
FROM elixir:1.4

# Copy ENV from host to container
ENV HOST_VARS inject_here

# Install node
RUN curl -sL https://deb.nodesource.com/setup_5.x | \
    bash - && apt-get install -y nodejs inotify-tools

# Install Elixir Deps
WORKDIR /app
ADD mix.* ./
RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.get

# Install Node Deps
WORKDIR /tmp

# Install app
WORKDIR /app
ADD . .
RUN mix compile

# Compile assets
RUN mix phoenix.digest

# Expose this port from the docker container to the host machine
EXPOSE 4000

# Run migrations, start server
RUN mix ecto.migrate
CMD mix phx.server
