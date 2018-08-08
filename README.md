# gitlab-sonar-scanner-java-maven
Gitlab docker container to execute sonar-scanner analysis (Java, Apache Maven based applications) 

## Usage
1) Create/Update `.gitlab-ci.yml`

~~~yaml
stages:
- quality

sonarqube:
  stage: quality
  image: forcelate/gitlab-sonar-scanner-java-maven
  variables:
    SONAR_HOST_URL: http://sonarqube.ipaddress
    SONAR_LOGIN: sonarqube_login
    SONAR_PASSWORD: sonarqube_password
  script:
  # know issues in java, apache maven based application
  # apk add --no-cache procps
  - mvn clean install 
  - sonar-scanner-ext
~~~

2) Create/Update `sonar-project.properties`

```
# Required metadata
sonar.projectKey=spring-boot-default-skeleton
sonar.projectName=Spring Boot Default Skeleton
sonar.projectVersion=1.0

# Comma-separated paths to directories with sources (required)
sonar.sources=src/main/java

# Comma-separated paths to directories with tests
sonar.tests=src/test/java

# Comma-separated paths to directories with classes binaries
sonar.java.binaries=target/classes

# Tells SonarQube where the unit tests execution reports are
sonar.junit.reportsPath=target/surefire-reports

# Tells SonarQube where the unit tests code coverage report is
sonar.jacoco.reportPaths=target/jacoco.exec

# Encoding of the source files
sonar.sourceEncoding=UTF-8

# Exclude
sonar.exclusions=src/main/java/com/forcelate/Application.java,\
  src/main/java/com/forcelate/configuration/**/*,\
  src/main/java/com/forcelate/domain/**/*,\
  src/main/java/com/forcelate/properties/**/*,\
  src/main/java/com/forcelate/resource/InfoResource.java
```

3) Install [Sonar GitLab Plugin](https://github.com/gabrie-allaigre/sonar-gitlab-plugin) in your SonarQube 
<p align="center">
	<img src="https://github.com/forcelate/gitlab-sonar-scanner-java-maven/img/sonar-gitlab-plugin-installation.png?raw=true" alt=""/>
</p>

4) to be continued...

### Known issues
issue: maven-surefire-plugin issue: [JIRA-1422](https://issues.apache.org/jira/browse/SUREFIRE-1422)  
solution: install `procps` or downgrade to version: 2.20

## Any ideas?
If you have any ideas, questions or suggestions, please don't hesitate to contact us at <info@forcelate.com> or submit new [Github issue](https://github.com/forcelate/gitlab-sonar-scanner-java-maven/issues/new).

## License (GNU-GPLv3)
Copyright (c) 2018 Forcelate <info@forcelate.com>
