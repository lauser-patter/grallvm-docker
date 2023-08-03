## 使用 docker 构建 `grallvm` 编译镜像

下面这个例子是基于 jdk17 gradle8.2.1

可以自行替换

```dockerfile
FROM ghcr.io/graalvm/graalvm-ce:ol7-java17-22.3.3
MAINTAINER wdd
# 解压 gradle 这里自己下载一个放到项目目录下
RUN wget
ADD gradle-8.2.1.tar /app
# 设置环境变量
ENV PATH "$PATH:/app/gradle-8.2.1/bin"
# 设置ali gradle 镜像
COPY init.gradle /root/.gradle/
# 声明工作目录
WORKDIR /app/project
# 将 demo 项目放到工作目录,需要注意demo 的 jdk 和 gradle 要与 容器中的环境一致
COPY project .
# 执行grallvm编译,这一步的目的是预先编译,将需要的依赖全部下载, 之后使用这个容器就不需要等太长时间
RUN gradle nativeCompile --info
# 编译完成删除demo
RUN rm -rf *
# 声明挂载卷
VOLUME /app/project
# 声明容器启动命令
CMD ["gradle","nativeCompile","--info"]
```