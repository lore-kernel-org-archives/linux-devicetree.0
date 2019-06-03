Return-Path: <SRS0=67YM=UC=amazon.co.uk=prvs=050bb738b=dwmw@kernel.org>
Content-Type: multipart/mixed; boundary="===============6372610292038816625=="
MIME-Version: 1.0
From: "Woodhouse, David" <dwmw@amazon.co.uk>
Subject: Re: [PATCH 1/2] dt-bindings: EDAC: add Amazon Annapurna Labs EDAC
 binding
Date: Mon, 3 Jun 2019 07:24:00 +0000
Message-ID: <64c95681e4b9cb018664508bb763f464c872d688.camel@amazon.co.uk>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
	 <1559211329-13098-2-git-send-email-hhhawa@amazon.com>
	 <20190530115446.GA14088@kroah.com> <20190531003504.GA2630@cz.tnic>
In-Reply-To: <20190531003504.GA2630@cz.tnic>
MIME-Version: 1.0
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "bp@alien8.de" <bp@alien8.de>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "Herrenschmidt, Benjamin" <benh@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--===============6372610292038816625==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/x-pkcs7-signature"; boundary="=-X1VpcOREXLQcBpjofZi8"

--=-X1VpcOREXLQcBpjofZi8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-05-31 at 02:35 +0200, Borislav Petkov wrote:
> On Thu, May 30, 2019 at 04:54:46AM -0700, Greg KH wrote:
> > I know I can't take patches without any changelog text,
>=20
> I thought I was the only one?! :-)

Looks like it had changelog text to me. It said:

dt-bindings: EDAC: add Amazon Annapurna Labs EDAC binding

I wouldn't want to see that information gratuitously repeated purely
for the sake of adding extra lines; that just makes the changelog less
succinct and more repetitive.

Is there any specific additional information that you think should be
in the commit message for this particular commit?

Or should we just include a snippet of Lorem ipsum, perhaps? :)


--=-X1VpcOREXLQcBpjofZi8
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEE4w
ggUuMIIEFqADAgECAhEArUDv6+74dq3c2eBL08L87zANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjAwMTAyMjM1
OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFkd213QGFtYXpvbi5jby51azCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAN2pISRkvUNV4yw2EDL6+sjW2wB5usKaF8RaGtUQswDeHkJ26xAJwnkz
hi6WV53Ta/X16t8nRvl8ayd415N7b5Wfttfxv5B5Y1TCMElPP16LOvTh0YSeO51aUUMp9jtBsD8n
HdYrV2c+DCvqsRE5MH4FyKIlU0ZK8xhtcsG3k4CPE+AkPPailHH3DdoWa5uuMoLTtELwcaDoXdyR
9T40IF5u1UILs73+3UsfMfk8QCnp5TZ4udVCIo2XL9VOFXF8nkJH7rBFHr0nGpU/ichL3/p0nF0w
u0LEuyavxmgY3uSfJTPvnlX2+Nf9eW1Kn8MGxMfGXkxoZxLL6EGMUM+wP08CAwEAAaOCAecwggHj
MB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBRV0Rb8VJdXONbe1ows
lxjL1P9RnjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcD
BAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQEC
AQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRT
MFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRp
Y2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJ
aHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRT
ZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMBwG
A1UdEQQVMBOBEWR3bXdAYW1hem9uLmNvLnVrMA0GCSqGSIb3DQEBCwUAA4IBAQBleXwqG1xXp96Y
OuoFMwoPBvXGe13r4ZEF+yFiw8BJO9LHZ6WIo98S45nfSPkNFwV7GrV98vMXgbNo1adTtBJOEGq+
RV074oILoCnQRjjVrLLPXk6SPHBD2XhwUgh32di5ihWCXBGIrjpgw6+iUYEKIEh2jilWL90xCava
X8zcLdfv+Kswr26P0OeVMC1qTeXhbp2PZhkJVQ2eNfOKn7VfvE6cdJyW6tVyIPDYnwbPLeuKfZkE
ClokUbw3jLoKECkD7YD9zqqAe2vHmJr7Sa2XzKkDrHAOBAxqbkpb3kDd/7xwM4ezBWa7mR/wWE95
CQOptkW7af3IHqpTCloPU9j2MIIFLjCCBBagAwIBAgIRAK1A7+vu+Hat3NngS9PC/O8wDQYJKoZI
hvcNAQELBQAwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAO
BgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01P
RE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEw
MjAwMDAwMFoXDTIwMDEwMjIzNTk1OVowIjEgMB4GCSqGSIb3DQEJARYRZHdtd0BhbWF6b24uY28u
dWswggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDdqSEkZL1DVeMsNhAy+vrI1tsAebrC
mhfEWhrVELMA3h5CdusQCcJ5M4Yulled02v19erfJ0b5fGsneNeTe2+Vn7bX8b+QeWNUwjBJTz9e
izr04dGEnjudWlFDKfY7QbA/Jx3WK1dnPgwr6rEROTB+BciiJVNGSvMYbXLBt5OAjxPgJDz2opRx
9w3aFmubrjKC07RC8HGg6F3ckfU+NCBebtVCC7O9/t1LHzH5PEAp6eU2eLnVQiKNly/VThVxfJ5C
R+6wRR69JxqVP4nIS9/6dJxdMLtCxLsmr8ZoGN7knyUz755V9vjX/XltSp/DBsTHxl5MaGcSy+hB
jFDPsD9PAgMBAAGjggHnMIIB4zAfBgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNV
HQ4EFgQUVdEW/FSXVzjW3taMLJcYy9T/UZ4wDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAw
IAYDVR0lBBkwFwYIKwYBBQUHAwQGCysGAQQBsjEBAwUCMBEGCWCGSAGG+EIBAQQEAwIFIDBGBgNV
HSAEPzA9MDsGDCsGAQQBsjEBAgEBATArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21v
ZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01P
RE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGLBggrBgEFBQcB
AQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
Y3NwLmNvbW9kb2NhLmNvbTAcBgNVHREEFTATgRFkd213QGFtYXpvbi5jby51azANBgkqhkiG9w0B
AQsFAAOCAQEAZXl8KhtcV6femDrqBTMKDwb1xntd6+GRBfshYsPASTvSx2eliKPfEuOZ30j5DRcF
exq1ffLzF4GzaNWnU7QSThBqvkVdO+KCC6Ap0EY41ayyz15OkjxwQ9l4cFIId9nYuYoVglwRiK46
YMOvolGBCiBIdo4pVi/dMQmr2l/M3C3X7/irMK9uj9DnlTAtak3l4W6dj2YZCVUNnjXzip+1X7xO
nHSclurVciDw2J8Gzy3rin2ZBApaJFG8N4y6ChApA+2A/c6qgHtrx5ia+0mtl8ypA6xwDgQMam5K
W95A3f+8cDOHswVmu5kf8FhPeQkDqbZFu2n9yB6qUwpaD1PY9jCCBeYwggPOoAMCAQICEGqb4Tg7
/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVh
dGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1p
dGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTEzMDEx
MDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVy
IE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVk
MT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVt
YWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvrOeV6wodnVAFsc4A5jTxhh2
IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf+bGBSyD9aH95dDSmeny1nxdlYCeX
IoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcfWlP8dSsE3Rfywq09N0ZfxcBa39V0
wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2jqPMLxFN
e1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO4nLUXk0B
OSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY7NkyMtQw
HQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8E
CDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBxBggrBgEF
BQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUFk
ZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJKoZI
hvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo7EIMERoh
42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaBQ+394k+z3ZBy
WPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKSTvtlenlxBhh7ETrN
543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY+hPebuPtTbq7vODqzCM6
ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5tdhYF/8v5UY5g2xANPECTQdu9v
WPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4jkhJiA7EuTecP/CFtR72uYRBcunw
wH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1tyZR2niOYihZ+FCbtf3D9mB12D4ln
9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4ognzgXtgtdk3ShrtOS1iAN2ZBXFiR
mjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAbR9HWdFqzcOoB/hxfEyIQpx9/s81r
gzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVh
dGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1p
dGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBAhEArUDv6+74dq3c2eBL08L87zANBglghkgBZQMEAgEFAKCCAe0wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNjAzMDcyMzU5WjAvBgkqhkiG9w0B
CQQxIgQgTI2VrPKiveNRfCmvxcjYFkQQnLoATb60WUEY3bNAGPswgb4GCSsGAQQBgjcQBDGBsDCB
rTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQCtQO/r7vh2rdzZ4EvT
wvzvMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0
ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUg
RW1haWwgQ0ECEQCtQO/r7vh2rdzZ4EvTwvzvMA0GCSqGSIb3DQEBAQUABIIBAEmdHsD94BGox1PQ
KSrTN/ouxRAj2YFHEOh8qmrB5G0HlyVrFqEl4u/Ta637Yrm/A4b14qCFyggLKUrVEBtAToww8h3R
FHvJRZQUlfLSfK2YX+IDHrDHTAxQpcQXKP3ocDBqFAAMX5vmpMGoKMaPgghCLwxG4kGFBAskzU6b
Zz7ioUEEk/meMVFSsAEr7zPEfm7dJ9j07A25BJHDjWsRg8MZjzbm1o47G1ALNAoI3dQb+EJXcfsm
2l/nhrAtzPhzwdlK4fmmV2B8wWb9oDYirZKl9ZLwlpq/oFYhmYkPVbn+NoozQ+acFby4R2YvNH9d
dQdibGUUkrK9wwm27Z03u4gAAAAAAAA=


--=-X1VpcOREXLQcBpjofZi8--

--===============6372610292038816625==
Content-Type: multipart/alternative; boundary="===============3310670776501542498=="
MIME-Version: 1.0
Content-Disposition: inline

--===============3310670776501542498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============3310670776501542498==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============3310670776501542498==--

--===============6372610292038816625==--
