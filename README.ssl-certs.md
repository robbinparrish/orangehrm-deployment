## SSL Certificate generation for OrangeHRM server.

### Generate Private Key.
```
openssl genrsa -out orangehrm.mydomain.com.key 4096
```

### Generate CSR.
```
openssl req -new -key orangehrm.mydomain.com.key -out orangehrm.mydomain.com.csr
```

### Now use this CSR file to buy the SSL certificates from CA Or create self-signed.
```
openssl x509 -in  orangehrm.mydomain.com.csr -out  orangehrm.mydomain.com.crt -req -signkey  orangehrm.mydomain.com.key -days 365
```

### Once done copy these certificates to certs directory ( `configs/certs` ) before running container.

