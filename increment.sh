#!/bin/bash
oldbuildNumber=$(awk -F '+' '/version:/ {print $2 }' pubspec.yaml)
buildNumber=$(awk -F '+' '/version:/ {print $2 = $2+1}' pubspec.yaml)
versionNumber=$(awk -F '[+ ]' '/version:/ {print $2}' pubspec.yaml)
echo "Current version $versionNumber+$oldbuildNumber > $versionNumber+$buildNumber"

echo "Update to version $versionNumber+$buildNumber in pubspec.yaml..."
# sed -i '/version:/d' pubspec.yaml
# #Add version: before environment
# sed -i "/environment/i version: $versionNumber+$buildNumber\n" pubspec.yaml
sed -i "s/version: .*/version: $versionNumber+$buildNumber/" pubspec.yaml

# echo "Update to version $versionNumber+$buildNumber in Jenkinsfile..."
# sed -i "/APP_VERSION_TAG =/d" Jenkinsfile
# #Add version: before SMV_VERSION_TAG
# sed -i "/SMV_VERSION_TAG = /i \\\t\tAPP_VERSION_TAG = \"v$versionNumber+$buildNumber\"" Jenkinsfile

echo "Update to version $versionNumber+$buildNumber in index.html..."

# sed  -E 's/(.*version=)([0-9]+)/echo "\1$((\2+1))"/e' web/index.html
#sed -i "/<\/body>/i \  <script src=\"main.dart.js?version=$buildNumber\" type=\"application\/javascript\"><\/script>" web/index.html
sed -i "s/scriptTag.src.*/scriptTag.src = 'main.dart.js?version=$buildNumber';/" web/index.html

git add pubspec.yaml
git add web/index.html
