# Use uma imagem base de Ubuntu
FROM ubuntu:20.04

# Instalar OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server

# Criar diretório necessário
RUN mkdir /var/run/sshd

# Permitir autenticação por senha
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Adicionar chave pública SSH
RUN mkdir -p /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Expor a porta SSH
EXPOSE 22

# Comando para iniciar o SSH
CMD ["/usr/sbin/sshd", "-D"]
