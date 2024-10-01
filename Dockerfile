FROM node:20 as base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80
RUN npm run build
FROM node:20-alpine AS production
COPY --from=base /usr/src/app /usr/src/app
CMD ["npm", "run", "preview"]
