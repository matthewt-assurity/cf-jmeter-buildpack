# cf-jmeter-buildpack

Buildpack to install JMeter to a Cloud Foundry app

# What does this buildpack do?

Downloads the version of JMeter specified in `parameters.sh`.

All JMeter files are available under `/home/vcap/app/jmeter`.

# How to get it working? 

## Java

JMeter also needs Java installed to run. It is recommended to use this buildpack in combination with the Java buildpack e.g in your manifest:

```yaml
---
buildpacks:
    - https://github.com/matthewt-assurity/cf-jmeter-buildpack
    - java_buildpack
---
```

You will also likely need to set the JAVA_HOME env var to get JMeter working. Here are some of the use cases of JAVA_HOME and running Java on a CF app:

1. If you use the official Java buildpack to create the start command for a Java app, then JAVA_HOME will be set as expected by the buildpack.
2. If you use a custom start command, it is your responsibility to set JAVA_HOME.
3. If you SSH into a CF app, it is your responsibility to set JAVA_HOME.

Points 2 and 3 are the usual ways that we use JMeter to run load tests on CF, therefore most of the time you will need to set JAVA_HOME yourself when using this buildpack. More details on this Stack Overflow answer [link](https://stackoverflow.com/a/48281677)

The recommended way of setting JAVA_HOME is to add an env var in your manifest e.g here is an example using the path to the `open_jdk_jre` that the Java buildpack installs.

```yaml
---
env:
    JAVA_HOME: /home/vcap/app/.java-buildpack/open_jdk_jre
---
```

## JMeter

Once you have set JAVA_HOME, you will be able to run JMeter. 

When using a custom start command, the working directory is set to the `/app/` directory, therefore you can execute JMeter by running `./jmeter/bin/jmeter.sh`.

When SSHing, the working directory is set to the `/home/` directory, therefore you can execute JMeter by running `./app/jmeter/bin/jmeter.sh`.

# License

MIT License