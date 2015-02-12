From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/2] ARM: dts: zynq: Add linux, stdout-path and stdout-path
Date: Thu, 12 Feb 2015 10:36:29 +0100
Message-ID: <0c4b1ee445924842ab035a291c3b6417@BN1BFFO11FD004.protection.gbl>
References: <0a0e0579fb6e2794d2c0c6fb9186c5b43618f448.1423657710.git.michal.simek@xilinx.com>
 <ea777ffbffea442e3bc69fe11183811772a5716e.1423657710.git.michal.simek@xilinx.com>
 <20150211124027.GH9154@leverpostej>
 <74a9cc5d88d64421a4f1ebdacee93d7d@BL2FFO11FD041.protection.gbl>
 <54DB9CEA.1060701@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="P3WHnP3m4nqCx06PUwH3UHMB24TVFbOvU"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54DB9CEA.1060701@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Josh Cartwright <josh.cartwright@ni.com>, "monstr@monstr.eu" <monstr@monstr.eu>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?windows-1252?Q?S=F6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ola Jeppsson <ola@adapteva.com>
List-Id: devicetree@vger.kernel.org

--P3WHnP3m4nqCx06PUwH3UHMB24TVFbOvU
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/11/2015 07:18 PM, Andreas F=E4rber wrote:
> Am 11.02.2015 um 15:25 schrieb Michal Simek:
>> On 02/11/2015 01:40 PM, Mark Rutland wrote:
>>> On Wed, Feb 11, 2015 at 12:29:02PM +0000, Michal Simek wrote:
>>>> parallella - Use reference instead of hardcoded path
>>>>              (linux,stdout-path)
>>>>
>>>> stdout-path is used by bootloader to identify console.
>>>>
>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>> ---
>>>>
>>>> U-Boot driver model requires stdout-path.
>>>> ---
>>>>  arch/arm/boot/dts/zynq-parallella.dts | 3 ++-
>>>>  arch/arm/boot/dts/zynq-zc702.dts      | 2 ++
>>>>  arch/arm/boot/dts/zynq-zc706.dts      | 2 ++
>>>>  arch/arm/boot/dts/zynq-zed.dts        | 2 ++
>>>>  arch/arm/boot/dts/zynq-zybo.dts       | 2 ++
>>>>  5 files changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/d=
ts/zynq-parallella.dts
>>>> index 6a5f51daa708..45228a427006 100644
>>>> --- a/arch/arm/boot/dts/zynq-parallella.dts
>>>> +++ b/arch/arm/boot/dts/zynq-parallella.dts
>>>> @@ -35,7 +35,8 @@
>>>> =20
>>>>  	chosen {
>>>>  		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmc=
blk0p2 rootfstype=3Dext4 rw rootwait";
>>>> -		linux,stdout-path =3D "/amba/serial@e0001000";
>>>> +		linux,stdout-path =3D &uart1;
>>>> +		stdout-path =3D &uart1;
>>>
>>> Given that you added aliases in the last patch, you can use that to
>>> refer to the serial:
>>>
>>> 	stdout-path - "serial0:115200n8";
>>>
>>> With or without the alias you can encode the UART configuration here
>>> too:
>>>
>>> 	stdout-path =3D "/amba/serial@e0001000:115200n8"
>>
>> let me check this configuration if it is supported by u-boot.
>=20
> I would be surprised if either is supported - my Parallella ships:
> U-Boot 2012.10-00003-g792c31c (Jan 03 2014 - 12:24:08)
> and upstream U-Boot still doesn't have support for the Parallella.

Ancient u-boot versions are not using this features. Zynq hasn't been
switched to DM anyway.

>>> Which makes the expected configuration explicit without relying on th=
e
>>> Linux-specific bootargs.
>>>
>>> Is there any reason to keep linux,stdout-path?
>>
>> Agree when stdout-patch is defined there is no reason to use linux,std=
out-patch.
>=20
> It's not used, it was added on reviewers' request at the time. Feel fre=
e
> to drop. But again, we are bound for patch conflict here.

I will solved that conflicts - it is easy one.

Thanks,
Michal


--P3WHnP3m4nqCx06PUwH3UHMB24TVFbOvU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlTcdCEACgkQykllyylKDCEVTgCeI5Kw9trfET6+DsS5GJy9iB1x
YGsAoJYPxmc5Db24rZwXQCGOdvBYpwsH
=wFBM
-----END PGP SIGNATURE-----

--P3WHnP3m4nqCx06PUwH3UHMB24TVFbOvU--
