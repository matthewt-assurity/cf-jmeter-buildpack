# cf-jmeter-buildpack

Buildpack to install JMeter to a Cloud Foundry app

# What does this buildpack do?

Downloads the version of JMeter and Java specified in `parameters.sh`.

All JMeter files are available under `/home/vcap/app/jmeter`.

All Java files are available under `/home/vcap/app/java`.

# How to get it working? 

## Java

JMeter also needs Java installed to run, and this buildpack will do this. This is inspired by: https://github.com/syahrul-aiman/nodejs-java-buildpack

Currently it downloads the Bellsoft Liberca Open JRE https://bell-sw.com/pages/downloads/#jdk-8-lts

Depending on how a buildpack is used and implemented, it is the responsibility of the user to set the JAVA_HOME and PATH env vars. See this Stack Overflow answer: https://stackoverflow.com/a/48281677

Here are the various ways that you can run Java on a CF app:

1. If you use the official Java buildpack to start a Java app, then JAVA_HOME will be set as expected. 
2. If you use a custom start command, it is your responsibility to set JAVA_HOME.
3. If you SSH into a CF app, it is your responsibility to set JAVA_HOME.

Points 2 and 3 are the usual ways that we use JMeter to run load tests on CF, therefore you will need to set JAVA_HOME and update the PATH yourself when using this buildpack.

The recommended way of setting JAVA_HOME is to add an env var in your manifest e.g

```yaml
---
env:
    JAVA_HOME: /home/vcap/app/java
---
```

## JMeter

Once you have set JAVA_HOME, you will be able to run JMeter. 

When using a custom start command, the working directory is set to the `/app/` directory, therefore you can execute JMeter by running `./jmeter/bin/jmeter.sh`.

# License

MIT License