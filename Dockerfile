FROM openjdk:8-jdk-alpine

ENV MAVEN_VERSION=3.5.3
ENV SONAR_SCANNER_VERSION=3.2.0.1227

# sonar-scanner
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    rm -rf sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    mv sonar-scanner-${SONAR_SCANNER_VERSION} /usr/lib/sonar-scanner

# apache maven
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip && \
    unzip apache-maven-$MAVEN_VERSION-bin.zip && \
    rm -rf apache-maven-$MAVEN_VERSION-bin.zip && \
    mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

ENV PATH="/usr/lib/mvn/bin:${PATH}"
ENV PATH="/usr/lib/sonar-scanner/bin:${PATH}"

# know issues

# maven-surefire-plugin issue: install procps or downgrade to version: 2.20
# JIRA issue: https://issues.apache.org/jira/browse/SUREFIRE-1422