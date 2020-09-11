#!/bin/bash



#this has to run only in valid ec2 instance
    chk_config()
    {
      #check if run inside an ec2-instance
      x=$(curl -s http://169.254.169.254/)
        if [ $? -gt 0 ]; then
        echo '[ERROR] Command not valid outside EC2 instance. Please run this command within a running EC2 instance.'
        exit 1
        fi
    }
chk_config

usage()
    {
    echo "you can pass arguments like this metadata.sh ami-id  ===> prints amiid"
    echo "Print all the values like this metadata.sh all to print all"
    }
    
#check if the number of arguments are correct
    if [ $# -eq 0 ]; then
            echo not enough arguments.
            echo you can choose anyone of the following
            usage
    fi
    
    echo_metadata()
    {
      #take input, append the argument to end of curl command and
      input=$1
      if [ $input == instance-identity ]; then 
        curlcmd=$(curl -fs http://169.254.169.254/latest/dynamic/$input/document)
        echo $curlcmd
        exit 
      fi
      #constructing curl command to append input and process the metadat
      curlcmd=$(curl -fs http://169.254.169.254/latest/meta-data/${input}/)

      #if the exit status is nonzero value , fail.
        if [ $? == 0 ]; then
                    echo -n $1": "
                    echo $curlcmd
        fi
      }


        echo_metadata $1

        if [ $# -eq 0 ]; then
                echo "you need to give inputs"
        fi


        #prints all the metadata
        echo_all()
        {
            echo_metadata ami-id
            echo_metadata identity-credentials/ec2/info
            echo_metadata mac
            echo_metadata ami-launch-index
            echo_metadata ami-manifest-path
            echo_metadata ancestor-ami-ids
            echo_metadata instance-id
            echo_metadata instance-type
            echo_metadata local-hostname
            echo_metadata local-ipv4
            echo_metadata kernel-id meta-data/kernel-id
            echo_metadata placement/availability-zone
            echo_metadata product-codes
            echo_metadata public-hostname
            echo_metadata public-ipv4
            echo_metadata ramdisk-id
            echo_metadata reservation-id
            echo_metadata security-groups
            echo_metadata user-data
            echo_metadata instance-identity
    }


        if [ $1 == all ]; then
               echo here is meteadata:
               echo_all
        fi
        