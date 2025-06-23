FROM cm2network/steamcmd:root

# Cambiar a usuario root para instalación
USER root

# Install mono

RUN apt-get update && apt-get install -y gnupg2
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list

# Instalar dependencias necesarias
RUN apt-get update -y && \
    apt-get install -y lib32stdc++6 curl mono-complete && \
    rm -rf /var/lib/apt/lists/*

# Crear directorio para el servidor
RUN mkdir -p /home/steam/scpsl-server && \
    chown steam:steam -R /home/steam/scpsl-server

# Crear directorio de configuracion para el servidor
RUN mkdir -p "/home/steam/.config/SCP Secret Laboratory/config/7777" && \
    chown steam:steam -R "/home/steam/.config"

# Cambiar a usuario steam
USER steam
WORKDIR /home/steam/scpsl-server

# Descargar el servidor dedicado
RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/scpsl-server +login anonymous +app_update 996560 validate +quit

# Exponer puertos principales (juego, query, RCON)
EXPOSE 7777/udp

# Volumen para configuración persistente (se creará en tiempo de ejecución)
VOLUME ["/home/steam/.config/SCP Secret Laboratory/config/7777"]

ENTRYPOINT [ "sh" ]
CMD ["/home/steam/scpsl-server/entrypoint.sh"]
