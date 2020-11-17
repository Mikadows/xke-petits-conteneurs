FROM ubuntu

RUN apr update && apt install ngix

CMD ["nginx", "-g", "daemon off;"]
