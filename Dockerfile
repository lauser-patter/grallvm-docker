FROM ghcr.io/graalvm/graalvm-ce:ol7-java17-22.3.3
MAINTAINER wdd
ADD gradle-8.2.1.tar /app
ENV PATH "$PATH:/app/gradle-8.2.1/bin"
COPY init.gradle /root/.gradle/
WORKDIR /app/project
COPY project .
RUN gradle nativeCompile --info
RUN rm -rf *
VOLUME /app/project
CMD ["gradle","nativeCompile","--info"]