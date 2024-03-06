ARG VAR=latest
FROM nginx:${VAR}
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
