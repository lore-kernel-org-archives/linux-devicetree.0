Return-Path: <SRS0=Fy5c=QS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mx-ginzinger.sigmacloud.services ([185.154.235.147]:46065 "EHLO
        mx-ginzinger.sigmacloud.services" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726358AbfBKIwO (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Feb 2019 03:52:14 -0500
Subject: Re: [PATCH 2/2] Input: st1232 - handle common DT bindings
References: <1548757144-2222-1-git-send-email-matthias.fend@wolfvision.net>
 <1548757144-2222-2-git-send-email-matthias.fend@wolfvision.net>
 <VI1PR08MB37589A1C275E8D0A1224037B85640@VI1PR08MB3758.eurprd08.prod.outlook.com>
 <20190211084502.GC95126@dtor-ws>
From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Message-ID: <c0732084-3baf-949a-83b3-154e2e93463b@ginzinger.com>
Date: Mon, 11 Feb 2019 09:51:58 +0100
In-Reply-To: <20190211084502.GC95126@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----137B2906461FAFE1AEB7779BE4E659C6"
Sender: devicetree-owner@vger.kernel.org
To: "'dmitry.torokhov@gmail.com'" <dmitry.torokhov@gmail.com>, Matthias Fend <Matthias.Fend@wolfvision.net>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is an S/MIME signed message

------137B2906461FAFE1AEB7779BE4E659C6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.02.19 09:45, 'dmitry.torokhov@gmail.com' wrote:
> Hi Matthias,
> 
> On Mon, Feb 11, 2019 at 07:15:12AM +0000, Matthias Fend wrote:
>> Hi Dmitry,
>>
>> You asked me if I could also include the conversion to touchscreen_report_pos() - which I did in this patch version.
>> Is there anything else missing?
> 
> Sorry, gmail decided to mark the v2 patches as spam for some reason :(
> I fished them out and applied.
> 
> Matthias, Martin, I noticed that the driver is still using MT-A
> protocol. Could you convert it to the proper MT-B (slotted) protocol?
> 

Yes, I thought about that actually. type A protocol is what matches the
controller here... It stores touch points consecutively in memory, but I
doubt that it tracks them (by keeping them at one position in its
memory, for instance). But yes, I want to test that.

                          martin

------137B2906461FAFE1AEB7779BE4E659C6
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOHAYJKoZIhvcNAQcCoIIODTCCDgkCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggshMIIF5jCCA86gAwIBAgIQapvhODv/K2ufAdXZuKdSVjANBgkq
hkiG9w0BAQwFADCBhTELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExp
bWl0ZWQxKzApBgNVBAMTIkNPTU9ETyBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3Jp
dHkwHhcNMTMwMTEwMDAwMDAwWhcNMjgwMTA5MjM1OTU5WjCBlzELMAkGA1UEBhMC
R0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9y
ZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBS
U0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+s55XrCh2dUAWxzgDmNPGGHYh
UPMleQtMtaDRfTpYPpynMS6n9jR22YRq2tA9NEjk6vW7rN/5sYFLIP1of3l0NKZ6
fLWfF2VgJ5cijKYy/qlAckY1wgOkUMgzKlWlVJGyK+UlNEQ1/5ErCsHq9x9aU/x1
KwTdF/LCrT03Rl/FwFrf1XTCwa2QZYL55AqLPikFlgqOtzk06kb2qvGlnHJvijjI
03BOrNpo+kZGpcHsgyO1/u1OZTaOo8wvEU17VVeP1cHWse9tGKTDyUGg2hJZjrqc
k39UIm/nKbpDSZ0JsMoIw/JtOOg0JC56VzQgBo7ictReTQE5LFLG3yQK+xS1AgMB
AAGjggE8MIIBODAfBgNVHSMEGDAWgBS7r34CPfqm8TyEjq3uOJjs2TIy1DAdBgNV
HQ4EFgQUgq9sjPjF/pZhfOgfPStxSF7Ei8AwDgYDVR0PAQH/BAQDAgGGMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwEQYDVR0gBAowCDAGBgRVHSAAMEwGA1UdHwRFMEMwQaA/
oD2GO2h0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNlcnRpZmljYXRp
b25BdXRob3JpdHkuY3JsMHEGCCsGAQUFBwEBBGUwYzA7BggrBgEFBQcwAoYvaHR0
cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQWRkVHJ1c3RDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTANBgkqhkiG9w0BAQwF
AAOCAgEAeFyygSg0TzzuX1bOn5dW7I+iaxf28/ZJCAbU2C81zd9A/tNx4+jsQgwR
GiHjZrAYayZrrm78hOx7aEpkfNPQIHGG6Fvq3EzWf/Lvx7/hk6zSPwIal9v5IkDc
ZoFD7f3iT7PdkHJY9B51csvU50rxpEg1OyOT8fk2zvvPBuM4qQNqbGWlnhMpIMwp
WZT89RY0wpJO+2V6eXEGGHsROs3njeP9DqqqAJaBa4wBeKOdGCWn1/Jp2oY6dyNm
NppI4ZNMUH4Tam85S1j6E95u4+1Nuru84OrMIzqvISE2HN/56ebTOWlcrurffade
2022O/tUU1gb4jfWCcyvB8czm12FgX/y/lRjmDbEA08QJNB2729Y+io1IYO3ztve
BdvUCIYZojTq/OCR6MvnzS6X72HP0PRLRTiOSEmIDsS5N5w/8IW1Hva5hEFy6fDA
fd9yI+O+IMMAj1KcL/Zo9jzJ16HO5m60ttl1Enk8MQkz/W3JlHaeI5iKFn4UJu1/
cP2YHXYPiWf2JyBzsLBrGk1II+3yL8aorYew6CQvdVifC3HtwlSam9V1niiCfOBe
2C12TdKGu05LWIA3ZkFcWJGaNXOZ6Ggyh/TqvXG5v7zmEVDNXFnHn9tFpMpOUvxh
csjycBtH0dZ0WrNw6gH+HF8TIhCnH3+zzWuDN0Rk6h9KVkfKehIwggUzMIIEG6AD
AgECAhBNQrEzGzrZ6FVYh1EEYH4+MA0GCSqGSIb3DQEBCwUAMIGXMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxm
b3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RP
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAe
Fw0xODA3MTgwMDAwMDBaFw0yMTA3MTcyMzU5NTlaMDAxLjAsBgkqhkiG9w0BCQEW
H21hcnRpbi5rZXBwbGluZ2VyQGdpbnppbmdlci5jb20wggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDsMC77L0D+2D8I8X5ubnBhADLgU+HtlwMTFt/WJIhc
kgbvnawYXWrCIpk8F6BJ0R/iFCykPdG7741EmlcHRKOJfhVxjXhwnoGFqnYmurCt
fvZLR3+mT3FWnVv2RAdrXscXH3BpijqqWabdtTbiTvmcl86Zc6mNlVhYZSbDul/E
voIGZotGcGIWrgZxN+8MQJQHKb0KHyWlPVPkrjvEfOJHKKLFsBNSnNMR95Ijg3Sp
h8/8RG490/zRHflGzUlxDSlLyY9YJGzSdDzcFKoYcc4oaaUY5N3uhRna43TLUIQh
6ybt3DKVz1Pw/ikwYJrOsulJrVr3D8KVHdGxq7HYl7jnAgMBAAGjggHfMIIB2zAf
BgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNVHQ4EFgQU/GtSUbHg
14sPDlmo27eQYwtjaS0wDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYD
VR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMEYGA1UdIAQ/MD0wOwYMKwYBBAGy
MQECAQMFMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQv
Q1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NP
TU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmww
gYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5jb21vZG9j
YS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMCoG
A1UdEQQjMCGBH21hcnRpbi5rZXBwbGluZ2VyQGdpbnppbmdlci5jb20wDQYJKoZI
hvcNAQELBQADggEBAGEuG01K1tt5i3gUdQkYem/KpbJUYBZd43QwmoTa0TGXUiYq
b+g/TeGG9QQ1yq+73xOr8fu6oT2608C7EiJc6JmjTs485/OZmTqgYkrLfs71F1kB
3Z59WPf5aoR/pnn5vdfkkoO29V1cKPJR4z+iOG2hOlcK/dXrX8i6mnL5DGIe8l5n
udUPvIbUhbMavrDd6kwhs0oCjylwdKGlFkCpKMn3HPflfDeHuV9Z8Nrpeq/7+Pm0
I/fLPkaYlULASJoJCucMYcedY9rmuro9JhV+NuVXaqLIrQPc1vyKFeRuLHh84M6c
1h1DArdGTykXZUwjXnnHtuOtzjIAzkx2Ns43vEsxggK/MIICuwIBATCBrDCBlzEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMT
NENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEE1CsTMbOtnoVViHUQRgfj4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwMjExMDg1MjEx
WjAvBgkqhkiG9w0BCQQxIgQgDIU6Xbn/lABld8CMgQoJ9GrWq9KTYu4QMUlI3mqs
dQsweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEA
QIIL0u6lvDTeYrWgrdzZpvIWweP2RRPxqUfCY1F7yVu0UWviACImQsPGVE0+XEEt
y7aBrm9Hj6AYehtFdS9gnHUD2D6WosLjYbEc9VWUM9pdhrM71ZN2f8mJzadb/UO1
2ld7BF9F5xxhQ+vzjs2Edq4EsAYXngzCO8ofzokjAh2U0XNbXbIOfrRA+Mu0a1AC
6WyzflHV+SfGs8DI1MrY4/7kgTXWjN9x1KOrYN+2pZGOCzTKY3ik0QUWzf/mJ3Kp
Aid00AenQhafqw420GuO9AFrywpCZthQZUURc9AcVSonknTTEVtvFxSdNibha3MI
eSPfb+r7sDJsPcnt4BwB1A==

------137B2906461FAFE1AEB7779BE4E659C6--
