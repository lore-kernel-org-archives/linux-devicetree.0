From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/2] ARM: dts: zynq: Add linux, stdout-path and stdout-path
Date: Wed, 11 Feb 2015 19:18:18 +0100
Message-ID: <54DB9CEA.1060701@suse.de>
References: <0a0e0579fb6e2794d2c0c6fb9186c5b43618f448.1423657710.git.michal.simek@xilinx.com> <ea777ffbffea442e3bc69fe11183811772a5716e.1423657710.git.michal.simek@xilinx.com> <20150211124027.GH9154@leverpostej> <74a9cc5d88d64421a4f1ebdacee93d7d@BL2FFO11FD041.protection.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="dJXSKNI2rcX3UuhQ9tjolGJFpnqqVugSJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74a9cc5d88d64421a4f1ebdacee93d7d@BL2FFO11FD041.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Josh Cartwright <josh.cartwright@ni.com>, "monstr@monstr.eu" <monstr@monstr.eu>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?windows-1252?Q?S=F6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ola Jeppsson <ola@adapteva.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dJXSKNI2rcX3UuhQ9tjolGJFpnqqVugSJ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 11.02.2015 um 15:25 schrieb Michal Simek:
> On 02/11/2015 01:40 PM, Mark Rutland wrote:
>> On Wed, Feb 11, 2015 at 12:29:02PM +0000, Michal Simek wrote:
>>> parallella - Use reference instead of hardcoded path
>>>              (linux,stdout-path)
>>>
>>> stdout-path is used by bootloader to identify console.
>>>
>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>> ---
>>>
>>> U-Boot driver model requires stdout-path.
>>> ---
>>>  arch/arm/boot/dts/zynq-parallella.dts | 3 ++-
>>>  arch/arm/boot/dts/zynq-zc702.dts      | 2 ++
>>>  arch/arm/boot/dts/zynq-zc706.dts      | 2 ++
>>>  arch/arm/boot/dts/zynq-zed.dts        | 2 ++
>>>  arch/arm/boot/dts/zynq-zybo.dts       | 2 ++
>>>  5 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dt=
s/zynq-parallella.dts
>>> index 6a5f51daa708..45228a427006 100644
>>> --- a/arch/arm/boot/dts/zynq-parallella.dts
>>> +++ b/arch/arm/boot/dts/zynq-parallella.dts
>>> @@ -35,7 +35,8 @@
>>> =20
>>>  	chosen {
>>>  		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmcb=
lk0p2 rootfstype=3Dext4 rw rootwait";
>>> -		linux,stdout-path =3D "/amba/serial@e0001000";
>>> +		linux,stdout-path =3D &uart1;
>>> +		stdout-path =3D &uart1;
>>
>> Given that you added aliases in the last patch, you can use that to
>> refer to the serial:
>>
>> 	stdout-path - "serial0:115200n8";
>>
>> With or without the alias you can encode the UART configuration here
>> too:
>>
>> 	stdout-path =3D "/amba/serial@e0001000:115200n8"
>=20
> let me check this configuration if it is supported by u-boot.

I would be surprised if either is supported - my Parallella ships:
U-Boot 2012.10-00003-g792c31c (Jan 03 2014 - 12:24:08)
and upstream U-Boot still doesn't have support for the Parallella.

>> Which makes the expected configuration explicit without relying on the=

>> Linux-specific bootargs.
>>
>> Is there any reason to keep linux,stdout-path?
>=20
> Agree when stdout-patch is defined there is no reason to use linux,stdo=
ut-patch.

It's not used, it was added on reviewers' request at the time. Feel free
to drop. But again, we are bound for patch conflict here.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Jennifer Guild, Dilip Upmanyu,
Graham Norton; HRB 21284 (AG N=FCrnberg)


--dJXSKNI2rcX3UuhQ9tjolGJFpnqqVugSJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU25zqAAoJEPou0S0+fgE/TOYQAI1RQSxkLSnBX7kU3Erl/Zk3
JlmhFqOcRQ5vBSY0LAbDneLNc8CAsxrhW9/GsD1ZbuXYI86BjFlap9I3ZI89Xtj9
y6pWq2GvZCI+uWamZYnvSgf+AGyBCKK9/Sls7T4cmrhNTHNAtxtiQkMsGnIVKSu/
Sef2P+LOyWAhu64T52XYnMROVYXeqEAz1mYzmgs8TysQh2Nd/cFsNqtyigpqGngO
9O8f8VA+c8r1XuIeN3O9YXX1HcRG7MJKlIHJOr43tQGVAdRAXF/nhdyEBtQ1Y5Ca
nPoZdjHy6wX3qiIE8ML4PRAmbCs3PDO/mDSXykc4bm1bLysYGuGVJENunJAP6kTo
LnKho3UTePO2JcJrR5tkc7Cc/WPE5rDx6z2Lyzd+lYC9+vZu60Puw2Sl0Qts9r2n
8r8wJsHdb8evOFT1Hk/eMiRN4mHMmXGBiNO5XsUhd5sr9/nObYzj+/mUrlLpwW+H
JM8WDF4I5/uLu4Y3DkFKuKVXAIezzj3RIjq/GsubN0nvovLic9p8Lip7VhY3zrJq
wIFTM5laKHaZOQrpT4JIk5cowZcwYW+VDW/W0tKvGETA0GfG7uG1f3A27WV2AJfg
3bim6X5sNFliirMnHSWHsltq44TOFIhs9Kxdbqt5+QIAUSXchPROfnH2CLMhRhW5
8exNbaCxUBeqUcvrj26z
=fUTj
-----END PGP SIGNATURE-----

--dJXSKNI2rcX3UuhQ9tjolGJFpnqqVugSJ--
