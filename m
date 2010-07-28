From: "Dezhong Diao (dediao)" <dediao@cisco.com>
Subject: RE: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Wed, 28 Jul 2010 15:47:20 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="----_=_NextPart_001_01CB2E96.148AEE28"
Return-path: <linux-mips-bounce@linux-mips.org>
Content-class: urn:content-classes:message
In-Reply-To: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Grant Likely <grant.likely@secretlab.ca>, David Daney <ddaney@caviumnetworks.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org, ralf@linux-mips.org, "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01CB2E96.148AEE28
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Grant,

I agree with your approach. Please go ahead to make changes and get the =
patches working with latest code in test tree. Or I am able to make =
changes in terms of your comments too.

It is best we can have MIPS OF support in 2.6.36, but I have you and =
Ralf decide it.


Thanks.


Dezhong =20

-----Original Message-----
From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf Of =
Grant Likely
Sent: Wednesday, July 28, 2010 12:26 PM
To: David Daney
Cc: Dezhong Diao (dediao); devicetree-discuss@lists.ozlabs.org; =
linux-mips@linux-mips.org; ralf@linux-mips.org; David VomLehn (dvomlehn)
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS

On Wed, Jul 28, 2010 at 1:19 PM, David Daney <ddaney@caviumnetworks.com> =
wrote:
> On 07/28/2010 11:54 AM, Grant Likely wrote:
>>
>> Hi Dezhong,
>
> [...]
>>
>> Very nice clean patch, thanks! =A0How/when would you like to see MIPS =

>> OF support go into mainline?
>>
>
> I can't speak for the patch authors, but my preference would be to=20
> have MIPS OF support go in to 2.6.36 if possible.
>
> How? To me it doesn't matter. =A0I would let you and Ralf fight it =
out.

It would probably be best if I at least pick up the first patch into my =
test tree to give it a spin with the latest changes.  I'd be happy to =
take the 2nd too to avoid ordering issues.

Cheers,
g.

------_=_NextPart_001_01CB2E96.148AEE28
Content-Type: application/octet-stream;
	name="8KG6-DeviceTree-512MB.dts"
Content-Transfer-Encoding: base64
Content-Description: 8KG6-DeviceTree-512MB.dts
Content-Disposition: attachment;
	filename="8KG6-DeviceTree-512MB.dts"

L2R0cy12MS87CgovIHsKCW1vZGVsID0gIkV4cGxvcmVyIjsKCWNvbXBhdGlibGUgPSAiRXhwbG9y
ZXIiLCAiQ2FsbGlvcGUiOwoJY29weXJpZ2h0ID0gIkNvcHlyaWdodCAoYykgMjAwOCBDaXNjbyBT
eXN0ZW1zLCBJbmMuICBBbGwgUmlnaHRzIFJlc2VydmVkLiI7CgkjYWRkcmVzcy1jZWxscyA9IDww
eDE+OwoJI3NpemUtY2VsbHMgPSA8MHgxPjsKCgljcHVzIHsKCQluYW1lID0gImNwdXMiOwoJCSNh
ZGRyZXNzLWNlbGxzID0gPDB4MT47CgkJI3NpemUtY2VsbHMgPSA8MHgwPjsKCgkJMjRrQDAgewoJ
CQlkZXZpY2VfdHlwZSA9ICJjcHUiOwoJCQlyZWcgPSA8MHgwPjsKCQkJY2xvY2stZnJlcXVlbmN5
ID0gPDB4NWY1ZTEwMDA+OwoJCQl0aW1lYmFzZS1mcmVxdWVuY3kgPSA8MHgxZmNhMDU1PjsKCQkJ
aS1jYWNoZS1zaXplID0gPDB4ODAwMD47CgkJCWQtY2FjaGUtc2l6ZSA9IDwweDgwMDA+OwoJCX07
Cgl9OwoKCW1lbW9yaWVzIHsKCQluYW1lID0gIm1lbW9yaWVzIjsKCQlkZXZpY2VfdHlwZSA9ICJt
ZW1vcnkiOwoJCSNhZGRyZXNzLWNlbGxzID0gPDB4Mz47CgkJI3NpemUtY2VsbHMgPSA8MHgwPjsK
CgkJbWVtb3J5QDAgewoJCQltZW1vcnlfdHlwZSA9ICJsb3ciOwoJCQlyZWcgPSA8MHgxMDAwMDAw
MCAweDIwMDAwMDAwIDB4ZmMwMDAwMD47CgkJfTsKCgkJbWVtb3J5QDEgewoJCQltZW1vcnlfdHlw
ZSA9ICJNSVBTIHJlc2V0IHZlY3RvciI7CgkJCXJlZyA9IDwweDFmYzAwMDAwIDB4N2ZjZmZmZiAw
eDQwMDAwMD47CgkJfTsKCgkJbWVtb3J5QDIgewoJCQltZW1vcnlfdHlwZSA9ICJncC1zcmFtIjsK
CQkJcmVnID0gPDB4OTA0MDAwMCAweDkwNDAwMDAgMHgzMDAwMD47CgkJfTsKCgkJbWVtb3J5QDMg
ewoJCQltZW1vcnlfdHlwZSA9ICJoaWdoIjsKCQkJcmVnID0gPDB4MmZjMDAwMDAgMHgyZmMwMDAw
MCAweDQwMDAwMD47CgkJfTsKCgkJbWVtb3J5QDQgewoJCQltZW1vcnlfdHlwZSA9ICJoaWdoIjsK
CQkJcmVnID0gPDB4NjAwMDAwMDAgMHg2MDAwMDAwMCAweDEwMDAwMDAwPjsKCQl9OwoJfTsKCglv
cHRpb25zIHsKCQluYW1lID0gIm9wdGlvbnMiOwoJCW1vY2EtcG9wdWxhdGVkID0gInRydWUiOwoJ
CWhkLXBvcHVsYXRlZCA9ICJmYWxzZSI7CgkJaXItcHJvdG9jb2wgPSAiTU9UIjsKCQludm0tc2l6
ZSA9IDwweDEwMD47CgkJZnJvbnQtcGFuZWwtYnV0dG9uID0gImJ1dHRvbiI7CgkJcHVzaC1idXR0
b24tbWF0cml4ID0gIm1hdHJpeCI7CgkJdHVuaW5nLXJhbmdlID0gPDB4MzM0MjhmMDA+OwoJCXJl
YXItdXNiID0gInRydWUiOwoJCXZpZGVvLXN1cHBvcnQgPSAidHJ1ZSI7CgkJY2FibGUtY2FyZCA9
ICJmYWxzZSI7CgkJZXRoZXJuZXQgPSAidHJ1ZSI7CgkJbW9jYS1yYW5nZSA9ICJEMS1EOCI7CgkJ
dXNiLTIwLWh1YiA9ICJmYWxzZSI7CgkJc2Vjb25kLXFwc2stcnggPSAidHJ1ZSI7CgkJZnJvbnQt
cGFuZWwgPSAiZm91ciI7CgkJdHVuZXItaWMyLWNsb2NrLWZyZXEgPSA8MHgzMj47CgkJbWVtb3J5
LWVuY3J5cHRpb24tc2NoZW1lID0gImZpeGVkLWtleSI7Cgl9OwoKCWNob3NlbiB7CgkJbmFtZSA9
ICJjaG9zZW4iOwoJCWJvb3RhcmdzID0gInJvb3Q9L2Rldi9zZGEyIjsKCQlsaW51eCxwbGF0Zm9y
bSA9ICIxa2c2IjsKCX07Cn07Cg==

------_=_NextPart_001_01CB2E96.148AEE28--
