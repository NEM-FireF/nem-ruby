# Proof of Concept 
This script was create by FireF NAGNFJ-DG3UEU-KHRN4E-YOJR63-SFYFHC-AQHK4H-2TYO 

# !!! Important Info !!!
There is no check if Account private key belongs to delegated or regular account.
So you risk to send your private key to a remote NIS and loose your XEM. 
Make your you realy understand the NEM Concept.

Don't use for production unless you now what you do.

#Description
nem-ruby Proof of Concept it is the Starting Point to get some ruby code for NEM.
 
#Usage
You have to put in delegated account Adress and delegated account privateKey into accounts.json

 
##Example 
nem-ruby$ ./harvesting.rb accounts.json
Account NBAQ2MSDYX2QUSPJJPDSZ3TDGSTCKW55M6JNJ7LP is harvesting
Disable Harvest
Account NA33NPNDHQFP2YFLKQVEK3KC3O3WJIUTTTYX4TU5 is not harvesting
Do not enable Harvest

nem-ruby$ ./harvesting.rb accounts.json
Account NBAQ2MSDYX2QUSPJJPDSZ3TDGSTCKW55M6JNJ7LP is not harvesting
Enable Harvest
Account NA33NPNDHQFP2YFLKQVEK3KC3O3WJIUTTTYX4TU5 is not harvesting
Do not enable Harvest


