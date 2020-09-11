# Sept-Challange
# echoing EC2 Metadata - Challenge 2

# usage:
 we can run this only in a valid running ec2 server.
 so we can copy this metadata.sh file on to any ec2 server using scp (secure copy) or any oter preferred file transfer

 after the copy , change the directory and check if it has execute permissions if not , add it using 
 ```
 chmod u+x metadata.sh

 ```

 Now run like following to retrieve all the ec2- meta info:
```
 ./metadata.sh all
```

you can run individual switches like  
```
./metada.sh amiid
'''


# Description

# Future version
  could run using power shell - Get-EC2InstanceMetadata Cmdlet in apowershell script rather than procesing curl url with linked ip-address

