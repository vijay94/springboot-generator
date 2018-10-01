#!/bin/bash

echo "Crafting spring boot application......."
echo "++++++++++sit back and relax+++++++++"

documentRoot=`pwd`
xmlPath="$documentRoot/sample_pom.xml"

read -p "Enter Path for the application(leave empty for the current path): "  path

read -p "Enter organization Name: "  orgName

read -p "Enter the project Name: "  projectName

read -p "Enter the package Name: "  packageName

read -p "Enter the Artifact Id(If empty package name will be taken): "  artifactId

if [ -z "$path" ];
then
	path=`pwd`
fi

if [ -z "$packageName" ];
then
	packageName="main"
fi

if [ -z "$artifactId" ];
then
	artifactId=$packageName
fi

echo "Creating project:\n Project Name: $projectName\n Path: $path\n Artifact Id: $artifactId"

cd $path

mkdir $projectName

cd $projectName

touch pom.xml
touch README.md

mkdir -p src/main/java/com/$orgName/$packageName
mkdir src/main/java/com/$orgName/$packageName/config
mkdir src/main/java/com/$orgName/$packageName/controllers
mkdir src/main/java/com/$orgName/$packageName/filters
mkdir src/main/java/com/$orgName/$packageName/models
mkdir src/main/java/com/$orgName/$packageName/repositories
mkdir src/main/java/com/$orgName/$packageName/request
mkdir src/main/java/com/$orgName/$packageName/response
mkdir src/main/java/com/$orgName/$packageName/utils

mkdir src/main/resources
touch src/main/resources/application.properties
touch src/main/resources/application-uat.properties
touch src/main/resources/application-prod.properties

mkdir -p src/test/java/com/$orgName/$packageName

mkdir target

IFS=
pomContent=`cat $xmlPath`

find="{{ orgName }}"
pomContent=${pomContent//$find/$orgName}

find="{{ packageName }}"
pomContent=${pomContent//$find/$packageName}

find="{{ artifactId }}"
pomContent=${pomContent//$find/$artifactId}

echo $pomContent > pom.xml

echo "Project Created Successfully.........."
