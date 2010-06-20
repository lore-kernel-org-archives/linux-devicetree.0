From: Stephan Gatzka <stephan-tNItQxeJkt8dnm+yROfE0A@public.gmane.org>
Subject: Re: PCI example for device tree
Date: Sun, 20 Jun 2010 07:57:26 +0200
Message-ID: <4C1DADC6.2060505@gatzka.org>
References: <4C1C9CEA.8050904@gatzka.org>
	<AANLkTik-TbdrIdr9YjeJGSlGH7-DUG_i1qK-X-aFVK4K@mail.gmail.com>
Reply-To: stephan-tNItQxeJkt8dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1657519802271318968=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTik-TbdrIdr9YjeJGSlGH7-DUG_i1qK-X-aFVK4K-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============1657519802271318968==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms060307020805080903070904"

This is a cryptographically signed message in MIME format.

--------------ms060307020805080903070904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Grant!

> Hi Stephan,
>
> Thanks for this work.  That is useful.  Before I take it out of draft,
> I'd like some changes to be made so that it better fits with the rest
> of the documents.  I talked about it in an earlier email, but I don't
> know if you got it or not.  Here's what I wrote:

No, unfortunately, I haven't read it.

>> - Instead, of using an MPC5200 example, add a pci bus to the sample
>> Coyote's Revenge system used in the rest of the page and describe
>> that.  The goal of this document is to lead a user step-by-step how
>> each part of the device tree works.  So, instead of plopping down the
>> complete PCI bus node, the document should gradually build it up, and
>> talk about each element as it is added.  Focus on how it all works
>> together.

My intention was to describe a working example for a Host-to-PCI bridge. =

Of course it is possible to rework it to your imaginary example but=20
again, I definitely prefer to do that for an existing board. Please just =

consider to write something about the interrupt-map property without=20
having the schematics and a user manual for the SoC used. I can't=20
explain it without the wiring of IDSEL lines and the mapping of IDSEL to =

device numbers in the PCI bridge.

>>
>> - It would be useful to also show a PCI-to-PCI bridge,
OK, but maybe sometimes later.
 >> and maybe a
>> fixed PCI device as children of the host bridge node.

OK, but I think at least for PCI the current policy is just to describe=20
the bridge and leave the PCI devices up for PCI probing code. So adding=20
a PCI device as a children might be a bit academically.

>
> The most important bit I think it to break up the adding of the PCI
> node so that it is built up piece by piece.  For each element being
> discussed, I want a reader to be able to focus on just the properties
> that are involved.

I have to think about it. My intention was more to explain what needs to =

be done for integrating a HOST-to-PCI bridge in a device tree and to=20
describe the properties that are necessary for. There are some=20
properties that belong together and I can't easily explain them=20
stand-alone. That's the reason why I used colors to display the related=20
properties.

I know that my sections breaks with the style you've used in the intro=20
document. But I think for this complex PCI thing it is better to have a=20
walk-through example.

Kind regards,

Stephan


--------------ms060307020805080903070904
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIO5jCC
BEYwggOvoAMCAQICEGb9R+PCGeToms2Z3fU6yyQwDQYJKoZIhvcNAQEFBQAwXzELMAkGA1UE
BhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAxIFB1Ymxp
YyBQcmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA1MTAyODAwMDAwMFoXDTE1
MTAyNzIzNTk1OVowgd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEf
MB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNl
IGF0IGh0dHBzOi8vd3d3LnZlcmlzaWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNv
bmEgTm90IFZhbGlkYXRlZDE3MDUGA1UEAxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFs
IFN1YnNjcmliZXIgQ0EgLSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMnf
rOfq+PgDFMQAktXBfjbCPO98chXLwKuMPRyVzm8eECw/AO2XJua2x+atQx0/pIdHR0w+VPhs
+Mf8sZ69MHC8l7EDBeqV8a1AxUR6SwWi8mD81zplYu//EHuiVrvFTnAt1qIfPO2wQuhejVch
rKaZ2RHp0hoHwHRHQgv8xTTq/ea6JNEdCBU3otdzzwFBL2OyOj++pRpu9MlKWz2VphW7NQIZ
+dTvvI8OcXZZu0u2Ptb8Whb01g6J8kn+bAztFenZiHWcec5gJ925rXXOL3OVekA6hXVJsLjf
aLyrzROChRFQo+A8C67AClPN1zBvhTJGG+RJEMJs4q8fef/btLUCAwEAAaOB/zCB/DASBgNV
HRMBAf8ECDAGAQH/AgEAMEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwEwKjAoBggrBgEFBQcC
ARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYTALBgNVHQ8EBAMCAQYwEQYJYIZIAYb4
QgEBBAQDAgEGMC4GA1UdEQQnMCWkIzAhMR8wHQYDVQQDExZQcml2YXRlTGFiZWwzLTIwNDgt
MTU1MB0GA1UdDgQWBBQRfV4ZfTwE32ps1qKKGj8x2DuUUjAxBgNVHR8EKjAoMCagJKAihiBo
dHRwOi8vY3JsLnZlcmlzaWduLmNvbS9wY2ExLmNybDANBgkqhkiG9w0BAQUFAAOBgQA8o9oC
YzrEk6qrctPcrVA4HgyeFkqIt+7r2f8PjZWg1rv6aguuYYTYaEeJ70+ssh9JQZtJM3aTi55u
uUMcYL3C3Ioth8FFwBFyBBprJCpsb+f8BxMp0Hc6I+f1wYVoGb/GAVQgGa41gsxiPGEJxvTV
67APpp8zhZrTcY5Qj5ndYjCCBUowggQyoAMCAQICEGYeo7xQ0H5LubI9b+ru3w4wDQYJKoZI
hvcNAQEFBQAwgd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0G
A1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0
IGh0dHBzOi8vd3d3LnZlcmlzaWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEg
Tm90IFZhbGlkYXRlZDE3MDUGA1UEAxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1
YnNjcmliZXIgQ0EgLSBHMjAeFw0wOTExMTMwMDAwMDBaFw0xMDExMTMyMzU5NTlaMIIBEzEX
MBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdv
cmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5jb20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBi
eSBSZWYuLExJQUIuTFREKGMpOTgxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDEz
MDEGA1UECxMqRGlnaXRhbCBJRCBDbGFzcyAxIC0gTmV0c2NhcGUgRnVsbCBTZXJ2aWNlMRcw
FQYDVQQDFA5TdGVwaGFuIEdhdHprYTEhMB8GCSqGSIb3DQEJARYSc3RlcGhhbkBnYXR6a2Eu
b3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzoYff7/WOfp73wx1jWbTO26u
vXBVo5E5ScnXuN1NozLAeUw7ZbFwLlRjQfbcz4oMQqhR5P4G620sF0MPu8PxkFwmiCmBPNcJ
oFvlHtZEktXp4Zj6hzIRFKZjdjDZWmyL7niIHUr1mh1x1yHAyPgA74KrfwaZaHqawflfjVl5
CJv8QwEFaTGSwW7XU3l5czwLrzUTSkdEytANFSSPI7aL5ub1uwzWltu9QsVa1mosFk4lKO4f
jKhKaixKV03hoTm9Yv6p2arRbBprtrq076QjH6r28c6ndiTPveVbQ9WNNJ3UrFQjEK9AnJGR
nfyA4FD62+YL5/s5aHMGd5zJeE793QIDAQABo4HMMIHJMAkGA1UdEwQCMAAwRAYDVR0gBD0w
OzA5BgtghkgBhvhFAQcXATAqMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy52ZXJpc2lnbi5j
b20vcnBhMAsGA1UdDwQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwSgYD
VR0fBEMwQTA/oD2gO4Y5aHR0cDovL0luZEMxRGlnaXRhbElELWNybC52ZXJpc2lnbi5jb20v
SW5kQzFEaWdpdGFsSUQuY3JsMA0GCSqGSIb3DQEBBQUAA4IBAQAntbPeTrLjXajrDpS4CKTK
CW3SFpIJ7qxrvXhXO0aT1w/tmpWEmGJks7QkJkReDNTi9fb4qAoywb8XTdWcWRAxxiVHHvya
o3quyuqa2yl7Te9UxqDUlXKV9d6WBGudlPDpcFGk/lgaMZ15Zb6mvfMx7IZMFCPJAOB3ns7g
SW++HOm8d4mKKd/x5pY1zLCqD1RTp9wD+y4rj0Xm6v8tNgJXWLBO7d9bfZIhajfju907yEaA
IyQXiLGq/AM52fbsss/RNp3qeOvRf81bAoseLhWV5CiuXCKsK5BTtREeMZwMLnl/rDwcsdzR
Pu8ccRl3aKKR6gl40l3MZEy77bb1PP0HMIIFSjCCBDKgAwIBAgIQZh6jvFDQfku5sj1v6u7f
DjANBgkqhkiG9w0BAQUFADCB3TELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJ
bmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQLEzJUZXJtcyBv
ZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwNTEeMBwGA1UECxMV
UGVyc29uYSBOb3QgVmFsaWRhdGVkMTcwNQYDVQQDEy5WZXJpU2lnbiBDbGFzcyAxIEluZGl2
aWR1YWwgU3Vic2NyaWJlciBDQSAtIEcyMB4XDTA5MTExMzAwMDAwMFoXDTEwMTExMzIzNTk1
OVowggETMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1
c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJ
bmNvcnAuIGJ5IFJlZi4sTElBQi5MVEQoYyk5ODEeMBwGA1UECxMVUGVyc29uYSBOb3QgVmFs
aWRhdGVkMTMwMQYDVQQLEypEaWdpdGFsIElEIENsYXNzIDEgLSBOZXRzY2FwZSBGdWxsIFNl
cnZpY2UxFzAVBgNVBAMUDlN0ZXBoYW4gR2F0emthMSEwHwYJKoZIhvcNAQkBFhJzdGVwaGFu
QGdhdHprYS5vcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDOhh9/v9Y5+nvf
DHWNZtM7bq69cFWjkTlJyde43U2jMsB5TDtlsXAuVGNB9tzPigxCqFHk/gbrbSwXQw+7w/GQ
XCaIKYE81wmgW+Ue1kSS1enhmPqHMhEUpmN2MNlabIvueIgdSvWaHXHXIcDI+ADvgqt/Bplo
eprB+V+NWXkIm/xDAQVpMZLBbtdTeXlzPAuvNRNKR0TK0A0VJI8jtovm5vW7DNaW271CxVrW
aiwWTiUo7h+MqEpqLEpXTeGhOb1i/qnZqtFsGmu2urTvpCMfqvbxzqd2JM+95VtD1Y00ndSs
VCMQr0CckZGd/IDgUPrb5gvn+zlocwZ3nMl4Tv3dAgMBAAGjgcwwgckwCQYDVR0TBAIwADBE
BgNVHSAEPTA7MDkGC2CGSAGG+EUBBxcBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LnZl
cmlzaWduLmNvbS9ycGEwCwYDVR0PBAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEF
BQcDAjBKBgNVHR8EQzBBMD+gPaA7hjlodHRwOi8vSW5kQzFEaWdpdGFsSUQtY3JsLnZlcmlz
aWduLmNvbS9JbmRDMURpZ2l0YWxJRC5jcmwwDQYJKoZIhvcNAQEFBQADggEBACe1s95OsuNd
qOsOlLgIpMoJbdIWkgnurGu9eFc7RpPXD+2alYSYYmSztCQmRF4M1OL19vioCjLBvxdN1ZxZ
EDHGJUce/Jqjeq7K6prbKXtN71TGoNSVcpX13pYEa52U8OlwUaT+WBoxnXllvqa98zHshkwU
I8kA4HeezuBJb74c6bx3iYop3/HmljXMsKoPVFOn3AP7LiuPRebq/y02AldYsE7t31t9kiFq
N+O73TvIRoAjJBeIsar8AznZ9uyyz9E2nep469F/zVsCix4uFZXkKK5cIqwrkFO1ER4xnAwu
eX+sPByx3NE+7xxxGXdoopHqCXjSXcxkTLvttvU8/QcxggTsMIIE6AIBATCB8jCB3TELMAkG
A1UEBhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBU
cnVzdCBOZXR3b3JrMTswOQYDVQQLEzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVy
aXNpZ24uY29tL3JwYSAoYykwNTEeMBwGA1UECxMVUGVyc29uYSBOb3QgVmFsaWRhdGVkMTcw
NQYDVQQDEy5WZXJpU2lnbiBDbGFzcyAxIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQSAtIEcy
AhBmHqO8UNB+S7myPW/q7t8OMAkGBSsOAwIaBQCgggLOMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEwMDYyMDA1NTcyNlowIwYJKoZIhvcNAQkEMRYEFC5h
pixtMtvX7Lvz9C8LJnqccQznMF8GCSqGSIb3DQEJDzFSMFAwCwYJYIZIAWUDBAECMAoGCCqG
SIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG
9w0DAgIBKDCCAQMGCSsGAQQBgjcQBDGB9TCB8jCB3TELMAkGA1UEBhMCVVMxFzAVBgNVBAoT
DlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYD
VQQLEzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykw
NTEeMBwGA1UECxMVUGVyc29uYSBOb3QgVmFsaWRhdGVkMTcwNQYDVQQDEy5WZXJpU2lnbiBD
bGFzcyAxIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQSAtIEcyAhBmHqO8UNB+S7myPW/q7t8O
MIIBBQYLKoZIhvcNAQkQAgsxgfWggfIwgd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJp
U2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMy
VGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZlcmlzaWduLmNvbS9ycGEgKGMpMDUxHjAc
BgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUGA1UEAxMuVmVyaVNpZ24gQ2xhc3Mg
MSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMgIQZh6jvFDQfku5sj1v6u7fDjANBgkq
hkiG9w0BAQEFAASCAQCkBwJIi8y17tIlXpvDmQ5zdU7+1hcBqxeogr+xA+prcUZN5wiJ2qfB
Eqj0Qdg4q20OYCyKvnS1xhuTMd9lNG5Fwo1r+peoVuX7d5IIQxnFiw2Zktm663vDdx3AFhlB
YVbF4//TfGLt25HRPiyOyj2xWTTuTJCa1498+w5d9uj/DaHQ69sF+2pW/cExuzyEcZvXISMq
Bm8PEsVlPPimg/UD8zk7dUmiizJIHnbAP4f0Mmll4Wjx43muWdB/MIToeDlYIEguVJmI/3Hb
qmlOVMH6L4TNR2UJlwonTKpiM/L64pZbCh8IfE0lPfz0v0aehVEJqx+mNpwzqv2TXG6J73XE
AAAAAAAA
--------------ms060307020805080903070904--

--===============1657519802271318968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1657519802271318968==--
