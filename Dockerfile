# 운영환경을 위한 Dockerfile

FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
# build 파일 container 안에 생성하기
RUN npm run build

FROM nginx
# container port mapping
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

