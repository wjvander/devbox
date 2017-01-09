FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y git vim curl wget man unzip tmux colord zsh build-essential

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install testing frameworks
RUN npm install --global cucumber gulp mocha

# Set Environment variables
ENV NODE_ENV local
ENV HOME /home/root
WORKDIR /home/root

# Install Zsh 
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
      && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
      && chsh -s /bin/zsh

# Create Shared data volume
RUN mkdir /var/shared/
VOLUME /var/shared

CMD ["zsh"]