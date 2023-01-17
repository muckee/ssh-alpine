FROM alpine:3.14

# Install git, node & npm
RUN apk update && apk add --no-cache \
                  openssh-client \
                  git \
                  nodejs \
                  npm

# Update npm and install yarn and workspace-tools as root
RUN npm install -g npm && npm i -g yarn yarn-workspace-tools @bazel/buildifier@5.1.0 @bazel/ibazel@0.16.2 autoprefixer@10.4.12 cross-env@7.0.3

# Create filesystem user
RUN addgroup -S 1000 && \
    adduser -S 1000 -G 1000 && \
    mkdir /home/1000/.ssh && \
    chown -R 1000:1000 /home/1000
ENV HOME /home/1000

# Login as filesystem user
USER 1000

# Install dependencies globally as filesystem user
RUN yarn global add @babel/core@7.19.3 \
                    @babel/plugin-syntax-flow@7.18.6 \
                    @babel/plugin-transform-react-jsx@7.19.0 \
                    @emotion/react@11.10.4 \
                    @emotion/styled@11.10.4 \
                    @mui/material@5.10.9 \
                    @testing-library/dom@8.19.0 \
                    @testing-library/jest-dom@5.16.5 \
                    @testing-library/react@13.4.0 \
                    @testing-library/user-event@13.5.0 \
                    eslint@8.0.0 \
                    eslint-config-react-app@7.0.1 \
                    framer-motion@7.6.1 \
                    json2mq@0.2.0 \
                    postcss@8.4.18 \
                    react@18.2.0 \
                    react-dom@18.2.0 \
                    react-particles@2.3.3 \
                    react-router-dom@6.4.2 \
                    react-scripts@5.0.1 \
                    react-tabs@5.1.0 \
                    remixicon@2.5.0 \
                    tsparticles@2.3.4 \
                    typescript@4.8.4 \
                    web-vitals@2.1.4

# Install devDependencies globally as filesystem user
#RUN yarn global add --dev @bazel/buildifier@5.1.0 \
#                          @bazel/ibazel@0.16.2 \
#                          autoprefixer@10.4.12 \
#                          cross-env@7.0.3
