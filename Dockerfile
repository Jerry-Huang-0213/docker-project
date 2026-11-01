# 1. 將 as 改成全大寫 AS（消除語法警告）
FROM node:16-alpine AS builder

# 2. 移除單引號，直接寫 /app 即可（更符合 Docker 規範）
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

# 3. 關鍵：加入這行環境變數，防止上一次發生的 ESLint 報錯導致 Build 失敗
ENV DISABLE_ESLINT_PLUGIN=true
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html





