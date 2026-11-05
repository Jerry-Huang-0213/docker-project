# 方案 B 專用：AWS 現場不需要安裝 Node，直接用 Nginx
FROM nginx:alpine

# 把 GitHub 現場編譯好的成品直接複製進去
COPY build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


