::Login to the OpenText registry
docker login registry.opentext.com
::Pull the required images
docker pull registry.opentext.com/dctm-server:23.4
docker pull registry.opentext.com/dctm-admin:23.4
::docker pull registry.opentext.com/dctm-rest:23.4
::docker pull registry.opentext.com/dctm-tomcat:23.4
docker pull registry.opentext.com/dctm-xplore-indexserver:22.1.4
docker pull registry.opentext.com/dctm-xplore-indexagent:22.1.4
docker pull registry.opentext.com/dctm-xplore-cps:22.1.4
