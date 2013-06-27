From: "Mr. Robert G Palmer Jr." <robert.palmer-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org>
Subject: Testing a OF Device Tree driver on a kernel using a board file.
Date: Thu, 27 Jun 2013 16:22:28 -0400
Message-ID: <F14D68B9-D4F3-4185-BF5A-833780FFCEFC@ingenutec.com>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Type: multipart/mixed; boundary="===============7660520791554807644=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7660520791554807644==
Content-Type: multipart/signed; boundary="Apple-Mail=_55CDC976-CE6A-4B38-BDDC-B310FABACDE3"; protocol="application/pkcs7-signature"; micalg=sha1


--Apple-Mail=_55CDC976-CE6A-4B38-BDDC-B310FABACDE3
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B3A2A934-D1C7-4846-8DCA-F1BC93A6749E"


--Apple-Mail=_B3A2A934-D1C7-4846-8DCA-F1BC93A6749E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I apologize up front if this is the wrong place for these questions.  =
I'm relatively new to the OF Device Tree.  If this is the wrong place, =
would someone point me to the correct discussion location.

1. Is it possible to take an existing kernel build that uses a board =
file move only a small portion into a Device Tree.  I am working on =
converting a driver from supporting only the board file to supporting =
both the board file and the OF Device Tree.  Unfortunately, the only =
test platform I have with the appropriate hardware is a Nexus7 and I'm =
using the Cyanogenmod build.  This uses (or at least appears to use) a =
board file for the Nexus7.  Is it possible to write a small Device Tree =
description for only the driver I am working on?  Where would this =
device tree file be placed? How would I include it in the build? Any =
assistance and/or pointers would be appreciated.

2. Are there any suggestions or hints for searching for OF Device Tree =
information.  The term "device tree" is used pervasively in the linux =
code and various projects to refer to source branches of a particular =
device type rather than the OF Device Tree.  This makes it extremely =
difficult to isolate applicable answers.

Thank you,
--=20
Robert G. Palmer, Jr.
President
Ingenutec, LLC
Mentor for HVA RoHAWKtics, FIRST Robotics Team 3824
865-405-5695
robert.palmer-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org
www.ingenutec.com




--Apple-Mail=_B3A2A934-D1C7-4846-8DCA-F1BC93A6749E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">I =
apologize up front if this is the wrong place for these questions. =
&nbsp;I'm relatively new to the OF Device Tree. &nbsp;If this is the =
wrong place, would someone point me to the correct discussion =
location.<div><br></div><div>1. Is it possible to take an existing =
kernel build that uses a board file move only a small portion into a =
Device Tree. &nbsp;I am working on converting a driver from supporting =
only the board file to supporting both the board file and the OF Device =
Tree. &nbsp;Unfortunately, the only test platform I have with the =
appropriate hardware is a Nexus7 and I'm using the Cyanogenmod build. =
&nbsp;This uses (or at least appears to use) a board file for the =
Nexus7. &nbsp;Is it possible to write a small Device Tree description =
for only the driver I am working on? &nbsp;Where would this device tree =
file be placed? How would I include it in the build? Any assistance =
and/or pointers would be appreciated.</div><div><br></div><div>2. Are =
there any suggestions or hints for searching for OF Device Tree =
information. &nbsp;The term "device tree" is used pervasively in the =
linux code and various projects to refer to source branches of a =
particular device type rather than the OF Device Tree. &nbsp;This makes =
it extremely difficult to isolate applicable =
answers.</div><div><br></div><div>Thank you,</div><div =
apple-content-edited=3D"true">
<span class=3D"Apple-style-span" style=3D"border-collapse: separate; =
color: rgb(0, 0, 0); font-family: Helvetica; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; border-spacing: 0px; -webkit-text-decorations-in-effect: none; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
font-size: medium; "><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; border-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; border-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; border-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; border-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; border-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><div>--&nbsp;</div><div>Robert G. Palmer, =
Jr.</div><div>President</div><div>Ingenutec, LLC</div><div>Mentor for =
HVA RoHAWKtics, FIRST Robotics Team =
3824</div><div>865-405-5695</div><div><a =
href=3D"mailto:robert.palmer-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org">robert.palmer-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org</a=
></div><div><a =
href=3D"http://www.ingenutec.com">www.ingenutec.com</a></div><br></div></s=
pan></div></span></div></span></div></span></div></span></div></span><br =
class=3D"Apple-interchange-newline">
</div>
<br></body></html>=

--Apple-Mail=_B3A2A934-D1C7-4846-8DCA-F1BC93A6749E--

--Apple-Mail=_55CDC976-CE6A-4B38-BDDC-B310FABACDE3
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIPOzCCBN0w
ggPFoAMCAQICEHGS++YZX6xNEoV0cTSiGKcwDQYJKoZIhvcNAQEFBQAwezELMAkGA1UEBhMCR0Ix
GzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEaMBgGA1UECgwR
Q29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMMGEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczAeFw0w
NDAxMDEwMDAwMDBaFw0yODEyMzEyMzU5NTlaMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMCVVQx
FzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
ITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVROLVVTRVJGaXJz
dC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAsjmFpPJ9q0E7YkY3rs3BYHW8OWX5ShpHornMSMxqmNVNNRm5pELlzkniii8efNIx
B8dOtINknS4p1aJkxIW9hVE1eaROaJB7HHqkkqgX8pgV8pPMyaQylbsMTzC9mKALi+VuG6JG+ni8
om+rWV6lL8/K2m2qL+usobNqqrcuZzWLeeEeaYji5kbNoKXqvgvOdjp6Dpvq/NonWz1zHyLmSGHG
TPNpsaguG7bUMSAsvIKKjqQOpdeJQ/wWWq8dcdcRWdq6hw2v+vPhwvCkxWeM1tZUOt4KpLoDd7Nl
yP0e03RiqhjKaJMeoYV+9Udly/hNVyh00jT/MLbu9mIwFIws6wIDAQABo4IBJzCCASMwHwYDVR0j
BBgwFoAUoBEKIz6W8Qfs4q8p74Klf9AwpLQwHQYDVR0OBBYEFImCZ33EnSZwAEu0UEh83j2uBG59
MA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggr
BgEFBQcDBDARBgNVHSAECjAIMAYGBFUdIAAwewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5j
b21vZG9jYS5jb20vQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwu
Y29tb2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDARBglghkgBhvhCAQEEBAMCAQYw
DQYJKoZIhvcNAQEFBQADggEBAJ2Vyzy4fqUJxB6/C8LHdo45PJTGEKpPDMngq4RdiVTgZTvzbRx8
NywlVF+WIfw3hJGdFdwUT4HPVB1rbEVgxy35l1FM+WbKPKCCjKbI8OLp1Er57D9Wyd12jMOCAU9s
APMeGmF0BEcDqcZAV5G8ZSLFJ2dPV9tkWtmNH7qGL/QGrpxp7en0zykX2OBKnxogL5dMUbtGB8SK
N04g4wkxaMeexIud6H4RvDJoEJYRmETYKlFgTYjrdDrfQwYyyDlWjDoRUtNBpEMD9O3vMyfbOeAU
TibJ2PU54om4k123KSZB6rObroP8d3XK6Mq1/uJlSmM+RMTQw16Hc6mYHK9/FX8wggUaMIIEAqAD
AgECAhBtGeqnGU9qMyLmIjJ6qnHeMA0GCSqGSIb3DQEBBQUAMIGuMQswCQYDVQQGEwJVUzELMAkG
A1UECBMCVVQxFzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNU
IE5ldHdvcmsxITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVRO
LVVTRVJGaXJzdC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMB4XDTExMDQyODAwMDAw
MFoXDTIwMDUzMDEwNDgzOFowgZMxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNo
ZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMTkwNwYD
VQQDEzBDT01PRE8gQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCShIRbS1eY1F4vi6ThQMijU1hfZmXxMk73nzJ9
VdB4TFW3QpTg+SdxB8XGaaS5MsTxQBqQzCdWYn8XtXFpruUgG+TLY15gyqJB9mrho/+43x9IbWVD
jCouK2M4d9+xF6zC2oIC1tQyatRnbyATj1w1+uVUgK/YcQodNwoCUFNslR2pEBS0mZVZEjH/CaLS
TNxS297iQAFbSGjdxUq04O0kHzqvcV8H46y/FDuwJXFoPfQP1hdYRhWBPGiLi4MPbXohV+Y0sNsy
fuNK4aVScmQmkU6lkg//4LFg/RpvaFGZY40ai6XMQpubfSJj06mg/M6ekN9EGfRcWzW6FvOnm//B
AgMBAAGjggFLMIIBRzAfBgNVHSMEGDAWgBSJgmd9xJ0mcABLtFBIfN49rgRufTAdBgNVHQ4EFgQU
ehNOAHRbxnhjZCfBL+KgW7x5xXswDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAw
EQYDVR0gBAowCDAGBgRVHSAAMFgGA1UdHwRRME8wTaBLoEmGR2h0dHA6Ly9jcmwudXNlcnRydXN0
LmNvbS9VVE4tVVNFUkZpcnN0LUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kRW1haWwuY3JsMHQGCCsG
AQUFBwEBBGgwZjA9BggrBgEFBQcwAoYxaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VUTkFkZFRy
dXN0Q2xpZW50X0NBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAhda+eFdVbTN/RFL+QtUGqAEDgIr7DbL9Sr/2r0FJ9RtaxdKtG3Nu
PukmfOZMmMEwKN/L+0I8oSU+CnXW0D05hmbRoZu1TZtvryhsHa/l6nRaqNqxwPF1ei+eupN5yv7i
kR5WdLL4jdPgQ3Ib7Y/9YDkgR/uLrzplSDyYPaUlv73vYOBJ5RbI6z9Dg/Dg7g3B080zX5vQvWBq
szv++tTJOjwf7Zv/m0kzvkIpOYPuM2kugp1FTahp2oAbHj3SGl18R5mlmwhtEpmG1l1XBxunML5L
SUS4kH7K0Xk467Qz+qA6XSZYnmFVGLQh1ZnV4ENAQjC+6qXnlNKw/vN1+X9u5zCCBTgwggQgoAMC
AQICEQDj3QRawAbQYrO+zLFzDHiXMA0GCSqGSIb3DQEBBQUAMIGTMQswCQYDVQQGEwJHQjEbMBkG
A1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01P
RE8gQ0EgTGltaXRlZDE5MDcGA1UEAxMwQ09NT0RPIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQg
U2VjdXJlIEVtYWlsIENBMB4XDTEzMDUyMTAwMDAwMFoXDTE0MDUyMTIzNTk1OVowLDEqMCgGCSqG
SIb3DQEJARYbcm9iZXJ0LnBhbG1lckBpbmdlbnV0ZWMuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEArGmRnDVXSVkZrHbU7R996df7vZvDDWxqzeMmLi4l89da9lp9g2jZpR1jf8eH
9hSL/ByF5vFKIx3tnU6CyX8q/+45bDrYp2XoLYuQIHTCnxYehuHMwijgaGHDGf2q7Cwz1FFCPqEG
Lv3X3+GH10g+UdXFj/juOcs3biEugZLSrZdletjc5fHuuV87C0utuRciu+lgQxWdXUcGJA7Jft7i
8qJObMjp1Mn/XyZHbTCYbUhuPwofZSvFQOZD7bu1AGgY4eMieoNmNLnGWpyId9UpBGH4IKItD0H0
CwdhlyZhHpilXWxlE7Vm1sCo4lPm9wGNCeKHL84v29Do3fvoGuX+ewIDAQABo4IB6zCCAecwHwYD
VR0jBBgwFoAUehNOAHRbxnhjZCfBL+KgW7x5xXswHQYDVR0OBBYEFGWX/uAqOEkri3+H6ynsSNNp
8owKMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcGCCsGAQUFBwMEBgsr
BgEEAbIxAQMFAjARBglghkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAQEw
KzApBggrBgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwVwYDVR0fBFAwTjBM
oEqgSIZGaHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RPQ2xpZW50QXV0aGVudGljYXRpb25h
bmRTZWN1cmVFbWFpbENBLmNybDCBiAYIKwYBBQUHAQEEfDB6MFIGCCsGAQUFBzAChkZodHRwOi8v
Y3J0LmNvbW9kb2NhLmNvbS9DT01PRE9DbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wJgYDVR0RBB8wHYEb
cm9iZXJ0LnBhbG1lckBpbmdlbnV0ZWMuY29tMA0GCSqGSIb3DQEBBQUAA4IBAQAxId6pLeslSuRz
sZg/W0HkF4OM7wq5YseaByjjRiR/uq617AP9x7Qvc31m06KrBFgv+j/+DAuWRhjMwQQJ0CEIiDm5
zcdZZLGk5MvjoMhcbyL7uN2rwqE416ZeEQy22tVRVIrTda1BwGuEO2YdwVr/b+uWLJZ2sy/m20CI
TRN7y7ICmHZUzJ6zGLokBUma2uXilULd/lNzsu6yMjrHpfNiGLZyhQcNe4ia4WZOX3f8QZ8w1Uqp
NBgUFy6nbVrviMe419JiLSxPAavqcyeJTxvpt5gJWivPRhxefUjHk7sBGp5/YPBrxKz2urqGfyOU
hiJOp/W55AGH00NAKjluyqBhMYIDrjCCA6oCAQEwgakwgZMxCzAJBgNVBAYTAkdCMRswGQYDVQQI
ExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBD
QSBMaW1pdGVkMTkwNwYDVQQDEzBDT01PRE8gQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1
cmUgRW1haWwgQ0ECEQDj3QRawAbQYrO+zLFzDHiXMAkGBSsOAwIaBQCgggHZMBgGCSqGSIb3DQEJ
AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEzMDYyNzIwMjIyOVowIwYJKoZIhvcNAQkE
MRYEFA9bIT1LpSUD4lEQ1EtCaajLp8hIMIG6BgkrBgEEAYI3EAQxgawwgakwgZMxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMTkwNwYDVQQDEzBDT01PRE8gQ2xpZW50IEF1dGhlbnRpY2F0
aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDj3QRawAbQYrO+zLFzDHiXMIG8BgsqhkiG9w0BCRAC
CzGBrKCBqTCBkzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
A1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxOTA3BgNVBAMTMENPTU9E
TyBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAOPdBFrABtBis77M
sXMMeJcwDQYJKoZIhvcNAQEBBQAEggEAH7o4+JSd0YHgrgFBxfSG0EnIqleRdDWxvVKJnK2Cg6Pw
8pJ5dnvP+WGLfAluNCz38WC/ICd8v2C2pk3Ua7RuUe+dr/LNbaO3Z3JprZ8GB1yFY3kiZDu/M+Mu
QzcyMGCKH7bqKGn6D3/Yie+hwISTnTjnr/q3/Uh9oTVvUT/SVQliyixwSo58KhIa5DQBwqiNBT3S
xzP87pJ2W1kP+iHotGw0XzlcPnm7liZ551bbXnBJeAkK3PQJQG/9upgTxox0QLJcwsZ/bx1QTnZ3
bZFftbBiJd0z2ifXaX2PpOPujZtXk7ieexEKqVlBYD/PH5WuHk3b5akGgWShR0lS5/Q3SAAAAAAA
AA==

--Apple-Mail=_55CDC976-CE6A-4B38-BDDC-B310FABACDE3--

--===============7660520791554807644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7660520791554807644==--
