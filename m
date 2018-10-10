Return-Path: <SRS0=XU5v=MW=amazon.co.uk=prvs=8143976b0=dwmw@kernel.org>
Content-Type: multipart/mixed; boundary="===============0448179319930268113=="
MIME-Version: 1.0
From: "Woodhouse, David" <dwmw@amazon.co.uk>
Subject: Re: [PATCH 1/2] dt-bindings: spi: dw: add cs-override property
Date: Wed, 10 Oct 2018 11:58:40 +0000
Message-ID: <ba83a08073614d9244c01218da28fe3e23f3bbc2.camel@amazon.co.uk>
References: <1539155293-21750-1-git-send-email-talel@amazon.com>
	 <20181010101825.GA6294@sirena.org.uk>
	 <dbac7f00-e9cc-ddac-5734-9763b5985ead@amazon.com>
	 <20181010112753.GC6294@sirena.org.uk>
In-Reply-To: <20181010112753.GC6294@sirena.org.uk>
MIME-Version: 1.0
To: "Shenhar, Talel" <talel@amazon.com>, "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Krupnik, Ronen" <ronenk@amazon.com>, "Wasserstrom, Barak" <barakw@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--===============0448179319930268113==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/x-pkcs7-signature"; boundary="=-GwVMZthKCmVmlDky42kU"

--=-GwVMZthKCmVmlDky42kU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-10-10 at 12:27 +0100, Mark Brown wrote:
> On Wed, Oct 10, 2018 at 02:23:40PM +0300, Talel Shenhar wrote:
> > On 10/10/2018 01:18 PM, Mark Brown wrote:
> > > On Wed, Oct 10, 2018 at 10:08:12AM +0300, Talel Shenhar wrote:
> > > > The dw spi controller has an auto-deselect of Chip-Select, in case =
there is
> > > > no data inside the Tx FIFO. While working on platforms with Alpine =
chips,
> > > Why would we ever want to use this behaviour?  It will be broken for =
any
> > > non-trivial SPI message such as those made with multiple transfers
> > > anyway.  Why not just unconditionally control it manually?
> > This behavior (auto-deselect of Chip-Select) is the default behavior of=
 dw spi controller hw.
> > On Alpine chip there is additional behavior added to the dw spi control=
ler hw that allows the sw to disable this behavior.
> > This patch allows the dw driver to enable this hw workaround and add th=
e needed sw manual control for it.
>=20
> If this is a modified IP with additional features then it should be
> given a new compatible string rather than having a property - it's not
> just configuration of the existing IP, it's a new thing and we may find
> there are other quirks that have to be taken care of for it.

No.

It's an extension of the existing IP which is explicitly designed to be
compatible with existing drivers via an opt-in feature.

Which is exactly what we've spent the last decade or two trying to beat
hardware designers into doing, instead of randomly breaking
compatibility for no good reason.


--=-GwVMZthKCmVmlDky42kU
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEE4w
ggUuMIIEFqADAgECAhEApEtL31g6H7ROXdOiQnA9RjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTcxMjIxMDAwMDAwWhcNMTgxMjIxMjM1
OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFkd213QGFtYXpvbi5jby51azCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAKdGKgXuwKMg2r+i/4BZZC0ddRxNq3xIKTakie/VCSzoO7P17A36ZzUc
VMEYPfqDt/65xoc6Tdih+qkY2pNDppZ1DZ8mVrAX6O2O60ZhmXB60wMoDvXPZInvkMOW4drqnje/
7/NOypn/XQAY+ln4KT+3tHG3TfryyJFMedqC/r29KJlCeeCxIzdtq2j5mN42tvPVv4+p+Kr77uui
GOASNdFJbNdgx7UGF+il6kRGSle17LJZKMgRiLJXYjECwnGwdfLdN5SINWD5IC3yXY8d14Bq6DyD
jNts1DFw+SKhW8kVFYRZpv7TE3/42QJKQVL6YWka5T4EJO7AD3gy2ypRsd8CAwEAAaOCAecwggHj
MB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBT/vhvBExl2wDr8f50u
b+0yzFyZRjAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcD
BAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQEC
AQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRT
MFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRp
Y2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJ
aHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRT
ZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMBwG
A1UdEQQVMBOBEWR3bXdAYW1hem9uLmNvLnVrMA0GCSqGSIb3DQEBCwUAA4IBAQCK2HofespbCaDu
udwwfh8GxDpVUnVbZZVWScpZMxfYpXzLot7L6iZrr16oMQ+UOiDDAK6/D3+u2QN8u0lJ6yLKVmvh
lGOzDywGsyG2Ohy8Dt5jcEK5sz84OsPtrRH7ahZHLxYPhWlUKOjOPN6sb9h6uMYlXmG/KmAr2rwF
exN6Zrwh6YwF7ukuMs175YcNyYRdB8kVYq3WikfbTHOoRbJiu9Unw7LqnvPTfx+xUvD6aN2CKLtr
mactWbk98swNgbI18UWjfEpugvAqw09CDLjeq7N1v0SkUkQEDqGSUE+hKFryTNXtZ6zOfl+MQfD8
U7T5oJa34DmWXK9+x7dl+MrqMIIFLjCCBBagAwIBAgIRAKRLS99YOh+0Tl3TokJwPUYwDQYJKoZI
hvcNAQELBQAwgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAO
BgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01P
RE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE3MTIy
MTAwMDAwMFoXDTE4MTIyMTIzNTk1OVowIjEgMB4GCSqGSIb3DQEJARYRZHdtd0BhbWF6b24uY28u
dWswggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCnRioF7sCjINq/ov+AWWQtHXUcTat8
SCk2pInv1Qks6Duz9ewN+mc1HFTBGD36g7f+ucaHOk3YofqpGNqTQ6aWdQ2fJlawF+jtjutGYZlw
etMDKA71z2SJ75DDluHa6p43v+/zTsqZ/10AGPpZ+Ck/t7Rxt0368siRTHnagv69vSiZQnngsSM3
bato+ZjeNrbz1b+Pqfiq++7rohjgEjXRSWzXYMe1BhfopepERkpXteyyWSjIEYiyV2IxAsJxsHXy
3TeUiDVg+SAt8l2PHdeAaug8g4zbbNQxcPkioVvJFRWEWab+0xN/+NkCSkFS+mFpGuU+BCTuwA94
MtsqUbHfAgMBAAGjggHnMIIB4zAfBgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNV
HQ4EFgQU/74bwRMZdsA6/H+dLm/tMsxcmUYwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAw
IAYDVR0lBBkwFwYIKwYBBQUHAwQGCysGAQQBsjEBAwUCMBEGCWCGSAGG+EIBAQQEAwIFIDBGBgNV
HSAEPzA9MDsGDCsGAQQBsjEBAgEBATArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21v
ZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01P
RE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGLBggrBgEFBQcB
AQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
Y3NwLmNvbW9kb2NhLmNvbTAcBgNVHREEFTATgRFkd213QGFtYXpvbi5jby51azANBgkqhkiG9w0B
AQsFAAOCAQEAith6H3rKWwmg7rncMH4fBsQ6VVJ1W2WVVknKWTMX2KV8y6Ley+oma69eqDEPlDog
wwCuvw9/rtkDfLtJSesiylZr4ZRjsw8sBrMhtjocvA7eY3BCubM/ODrD7a0R+2oWRy8WD4VpVCjo
zjzerG/YerjGJV5hvypgK9q8BXsTema8IemMBe7pLjLNe+WHDcmEXQfJFWKt1opH20xzqEWyYrvV
J8Oy6p7z038fsVLw+mjdgii7a5mnLVm5PfLMDYGyNfFFo3xKboLwKsNPQgy43quzdb9EpFJEBA6h
klBPoSha8kzV7Weszn5fjEHw/FO0+aCWt+A5llyvfse3ZfjK6jCCBeYwggPOoAMCAQICEGqb4Tg7
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
IEVtYWlsIENBAhEApEtL31g6H7ROXdOiQnA9RjANBglghkgBZQMEAgEFAKCCAe0wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgxMDEwMTE1ODM5WjAvBgkqhkiG9w0B
CQQxIgQgSGn+F69sJMfEjGB/mh4vhykcQYz6pSH5UBJs10ECmREwgb4GCSsGAQQBgjcQBDGBsDCB
rTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQCkS0vfWDoftE5d06JC
cD1GMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0
ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUg
RW1haWwgQ0ECEQCkS0vfWDoftE5d06JCcD1GMA0GCSqGSIb3DQEBAQUABIIBADsUy2icASSwhsYA
6oABeBIzZSR50ZmWsQ1/FMc6NXV4s+JOIy/FrKivqZFEkOS9LNIF+GKgd5a7zauglbbQhdIWDRtv
AcBUPC8xsqLQS+8GSx2aC3Pi4k474Wc3++j++hD6977FPvpnGThcpFJFk0oie7T+BzdUJB161MGy
+m90sc+4Qt2IXO4QP3DuY7w6R3QgwqrlrAh78syEQnPmY4ghqL+OMyhVHMrxQlpGV3RD9YRnWgw0
Bp55jssLBAIzts8zftRN348qvwGTV+cDcOCobtz2F4gEchJlRXokNWrpV/pDXuICC3BG6Wj4rF5M
QYzUegdmQkGrcyT6GQzXj5oAAAAAAAA=


--=-GwVMZthKCmVmlDky42kU--

--===============0448179319930268113==
Content-Type: multipart/alternative; boundary="===============1019058035833703043=="
MIME-Version: 1.0
Content-Disposition: inline

--===============1019058035833703043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============1019058035833703043==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============1019058035833703043==--

--===============0448179319930268113==--
