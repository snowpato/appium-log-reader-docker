#Using Java Image
FROM openjdk:8

ARG ALR_HOME=/var/appium-log-reader
ARG ALR_PORT=5000

ENV ALR_HOME $ALR_HOME
ENV ALR_PORT $ALR_PORT

#Make AppDir
RUN mkdir -p $ALR_HOME

#Download Appium Log Reader
RUN wget https://github.com/mobileboxlab/appium-log-reader/releases/download/v1.1.0/appium-log-reader-service-1.1.0.jar
RUN mv appium-log-reader-service-1.1.0.jar ${ALR_HOME}

#Create Volume
VOLUME $ALR_HOME

#Run the jar
#CMD ["java", "-jar", "${ALR_HOME}/appium-log-reader-service.jar", "-p", "${ALR_PORT}"]
CMD java -jar ${ALR_HOME}/appium-log-reader-service-1.1.0.jar -p ${ALR_PORT}

#Expose port
EXPOSE $ALR_PORT