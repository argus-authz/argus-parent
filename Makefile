all: install

install:
	@echo "Install in local maven repository"
	mvn -B -s project/maven-settings.xml install

deploy:
	@echo "Deploy in remote maven repository"
	mvn -B deploy
