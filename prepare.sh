#!/bin/bash
curl -O https://free.nchc.org.tw/ndc.odf/NDCODFWEB-V1.7.zip
unzip -x NDCODFWEB-V1.7.zip
yum localinstall NDCODFWEB-V1.7/ndcodfsys/gumbo* -y
yum localinstall NDCODFWEB-V1.7/ndcodfsys/ndcodfsys* -y 
yum localinstall NDCODFWEB-V1.7/poco/poco* -y
yum localinstall NDCODFWEB-V1.7/ndcodfweb/ndcodfweb* -y

