# This file is for config variables, and is designed to be sourced by the buildpack scripts.

# jmeter setup
# Latest releases available at https://github.com/aptible/supercronic/releases
JMETER_VERSION="5.6.3"
JMETER_URL=https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
JMETER_ARCHIVE=apache-jmeter-${JMETER_VERSION}.tgz
JMETER_DIR=apache-jmeter-${JMETER_VERSION}
JMETER_FILE=jmeter

# Dependencies path
# JMETER_DEPS_DIR="${DEPS_DIR}/${DEPS_IDX}/${JMETER_DIR}"


