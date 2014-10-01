#!/bin/bash
USERDATA="user-data.yaml"
STATE="terraform.tfstate"

# Delete user data and tfstate files if they exists
if [ -e ${USERDATA} ]; then
  rm ${USERDATA}
fi

if [ -e ${STATE} ]; then
  rm ${STATE}
fi

# Set a new discovery URL
DISCOVERY=`curl -s https://discovery.etcd.io/new | grep http | awk -F "/" '{print $4}'`

# Copy the user data yaml as a tmp file so we can sed
cp ${USERDATA}.template ${USERDATA}.tmp

# Search and replace the value to user-data.yaml and delete the tmp one
sed  "s/<token>/${DISCOVERY}/" ${USERDATA}.tmp > ${USERDATA}
rm ${USERDATA}.tmp

terraform apply -state=terraform.tfstate