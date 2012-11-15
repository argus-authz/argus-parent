all: mvn_install

mvn_install:
	@echo "Install in local maven repository"
	mvn -B -s project/maven-settings.xml install
