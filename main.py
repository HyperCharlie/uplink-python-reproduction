from uplink_python.uplink import Uplink

api_key = "INSERT KEY HERE" 
satellite = "us-central-1.tardigrade.io:7777"
encryption_passphrase = "PASSPHRASE HERE" 

uplink = Uplink()
access = uplink.request_access_with_passphrase(satellite,
                                                api_key,
                                                encryption_passphrase)
client = access.open_project()
