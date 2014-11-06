From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: dts: zynq: Enable PL clocks for Parallella
Date: Thu, 06 Nov 2014 19:34:40 +0100
Message-ID: <545BBF40.8060602@suse.de>
References: <1415294531-8942-1-git-send-email-afaerber@suse.de> <e78290abdb85497081f502e5886bf045@BL2FFO11FD057.protection.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="TtpEoMKg2jPFLjudOfH4IwEJeMgGrI2Fs"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <e78290abdb85497081f502e5886bf045@BL2FFO11FD057.protection.gbl>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TtpEoMKg2jPFLjudOfH4IwEJeMgGrI2Fs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi S=C3=B6ren,

Am 06.11.2014 um 18:33 schrieb S=C3=B6ren Brinkmann:
> On Thu, 2014-11-06 at 06:22PM +0100, Andreas F=C3=A4rber wrote:
>> The Parallella board comes with a U-Boot bootloader that loads one of
>> two predefined FPGA bitstreams before booting the kernel. Both define =
an
>> AXI interface to the on-board Epiphany processor.
>>
>> Enable clocks FCLK0..FCLK3 for the Programmable Logic by default.
>>
>> Otherwise accessing, e.g., the ESYSRESET register freezes the board,
>> as seen with the Epiphany SDK tools e-reset and e-hw-rev, using /dev/m=
em.
>=20
> Yeah, this is the problem. Bypassing the kernel banging on memory
> directly through /dev/mem does not leave any chance of enabling clocks =
on
> demand through the proper interfaces.
>=20
> Though, this is a valid workaround for the immediate problem, longer
> term, you should consider adding some kind of proper kernel driver for
> this interface that would then use the clock framework to control the
> required clocks dynamically.

Yes, Adapteva has a new char driver, and I have a proof-of-concept
platform driver on the branch I mentioned (where I had experimented with
enabling the wrong clock: adi,axi-clkgen-2.00a).
https://github.com/afaerber/linux/commits/parallella-next

But as there is no such driver in 3.17 or 3.18, I consider this patch
the right short-term fix according to your earlier message.

Apart from fixing functionality for users, it buys us more time to find
a consensus on how the kernel driver(s) should actually look like. ;)
My goal is having the DT describe the chip rather than some userspace
text/XML file and to have all chip-specific quirks in the driver.
I've been reading up on remoteproc, but it doesn't quite seem to match
the deployment model for Epiphany AFAICT.

Also, as discussed during the initial submission, we'll need to split
and reorganize the .dts file once we start adding nodes beyond the
common Epiphany IP.

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 21284 AG N=C3=BC=
rnberg


--TtpEoMKg2jPFLjudOfH4IwEJeMgGrI2Fs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJUW79AAAoJEPou0S0+fgE/P/EP/Rh9sPFPg9iHnqqh4LLooQnp
12pwqsX5qu/FBKJMlqOTYsTt+1LwlruJjx+AmiJz8VwTzsbd32UuLvntxnfpnzTz
ezZr+GyAY1oegOeMAmkPA8nGP/cm4FAyDYx1wOegputUG61tWOSk/g44+dEdB7UV
ZRvoMDpZdRB7G0MOF2wYaPpGU/ZoXoB40Twz0ShYJKSq3NnX+dWvWIcmPa4PSEyG
aFvh56mnF4iwt3MSeatucVBwx7/QC9hwabPLqjqmbMFmeBngoIpUaqEvxM83XPDB
ifgUWtY91C99B2HOXDxyuXJxC67tmgaV3GUhFeYTi1MMJ+VTVVTQsDmWtkVi0C3o
F1RAqlEAK2A+ij2oympCyl+kc2/uyrBiaZqYfV+ncMGdwsc4FRzv3oTKS0Tr5YGx
9kNlPi5BB9SwEM8zlWFpemQRO1iZ6jEUwy2gfk/sWItexpnSXSbDBUYw9EP4p+bM
ZaMO+g2q2GQlE1aGfudv+YGsEhTbD5yWwAHGnhKB/gNXnU0PF7ZwWDcP7ULWKoYi
vaEeawKmfpT9JxLQ8aOTA1A3Trmg7ETCXo0EQl1NZ247dnIgO3D8E/aHe9I32iWu
akq7Tkkb4cekLaFtRBy0l8a3UzZEdZW9vGOW8TbalQTlv1uFwxsPsmVc34AfUhoz
qGbh3RHJ02UVYphw3Pem
=IZrM
-----END PGP SIGNATURE-----

--TtpEoMKg2jPFLjudOfH4IwEJeMgGrI2Fs--
