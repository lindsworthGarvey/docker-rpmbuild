#!/bin/sh

product_specs=$1
if [ -z ${product_specs} ]
   then
      echo "Please enter a SPEC file against which to build the RPM"
   exit 1
   else
     wget $(sed  -n '/^Source0/p' ${product_specs}| awk {'print $2'}) -P ~/rpmbuild/SOURCES
fi

