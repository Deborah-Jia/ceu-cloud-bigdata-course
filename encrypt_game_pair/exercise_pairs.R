## Exercise

# 1. Pair up.
# 2. Generate and exchange public keys
# 3. Send one encrypted question to your peer (both of you).
# 4. Send an encrypted answer back to your peer and decrypt the answer. 
# 5. save it to disk

# Exchange public keys
# using your pair's public key, encode and send your question
# your pair decode it, and encode the answer using your public key, sent it back to you
# you decode his answer; see if it answers your question.

library(PKI)


# Create public and private key
key <- PKI.genRSAkey(bits = 2048L)

prv.pem <- PKI.save.key(key, private=TRUE)
print(prv.pem)

pub.pem <- PKI.save.key(key, private=FALSE)
print(pub.pem)

# load the key into two new variables, extract
pub.key <- PKI.load.key(pub.pem)
prv.key <- PKI.load.key(prv.pem)

# Save the keys to a file, then load them back
write(pub.pem, file="id_rsa.pub") # Save Public key 
write(prv.pem, file="id_rsa")     # Save Private key

###############################################################################
## loading in pair’s public key
pub_Fasih.pem.loaded <- scan('f_id_rsa.pub', what = 'list', sep = '\n') # Load
# Extract the key objects from the PEM file
pub_Fasih.key.loaded <- PKI.load.key(pub_Fasih.pem.loaded)

# Encrypt and decrypt, again:
encrypted <- PKI.encrypt(charToRaw("what's your dinner"), pub_Fasih.key.loaded)

# Create a connection object to write the binary file using mode “wb”
write.filename = file('deborah_message.dat','wb')
# Write the column names of the data frame to the connection object
writeBin(encrypted, write.filename)
close(write.filename)


# read data
read.binfile = file("encrypted_Fasih.dat", "rb")
read.encrypted.data <- readBin(read.binfile, raw(), n=999999999) # 'n' says how many bytes
close(read.binfile)

decrypted <- rawToChar(PKI.decrypt(read.encrypted.data, prv.key))
print(decrypted)


##############################################################################

## enctypt my answer to pair


encrypted <- PKI.encrypt(charToRaw("every session spent with happy tree friends"), pub_Fasih.key.loaded)


write.filename = file('debs_answer.dat','wb')

writeBin(encrypted, write.filename)
close(write.filename)

## decrypt pair's answer 
read.binfile = file("xinqis_answer.dat", "rb")
read.encrypted.data <- readBin(read.binfile, raw(), n=999999999) # 'n' says how many bytes
close(read.binfile)

decrypted <- rawToChar(PKI.decrypt(read.encrypted.data, prv.key))
print(decrypted)


