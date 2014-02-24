From: Michal Simek <monstr@monstr.eu>
Subject: Re: SPDX-License-Identifier
Date: Mon, 24 Feb 2014 15:03:25 +0100
Message-ID: <530B512D.8090308@monstr.eu>
References: <20140221160442.GA17506@kroah.com> <5307790A.4050806@monstr.eu> <20140221161246.GM31902@saruman.home> <53077C5F.9000407@monstr.eu> <20140221162045.GN31902@saruman.home> <20140221165633.GA5465@kroah.com> <53078C30.7060703@monstr.eu> <20140221175720.GA21660@kroah.com> <20140221190125.GL31047@thunk.org> <530B1B25.5090601@monstr.eu> <20140224134150.GB25357@thunk.org>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ehuHqNk3iLxT31GSeNWqi616QXPxdrd86"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140224134150.GB25357@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>, devicetree@vger.kernel.org, Wolfgang Denk <wd@denx.de>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ehuHqNk3iLxT31GSeNWqi616QXPxdrd86
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 02/24/2014 02:41 PM, Theodore Ts'o wrote:
> On Mon, Feb 24, 2014 at 11:12:53AM +0100, Michal Simek wrote:
>>> But of course, I'm not a lawyer, and if your company has is paying fo=
r
>>> the development of the driver, the Golden Rule applies (he who has th=
e
>>> Gold, makes the Rules), and each of our respective corporate lawyers
>>> may have different opinions about what might happen if the question
>>> was ever to be adjudicated in court.
>>
>> Aren't all these points already answered by SPDX project?
>> I believe that they should know how this should be handled properly.
>=20
> The SPDX can not give legal advice; not to you, and not to your
> company.  One lawyer might believe that=20
>=20
> /*
>  * SPDX-License-Identifier: GPL-2.0
>  */
>=20
> Might be sufficient.  Others might believe you need to do:
>=20
> /*
>  * Copyright Ty Coon, 2012.
>  *=20
>  * SPDX-License-Identifier: GPL-2.0
>  */
>=20
> Still others might believe you need at the very least:
>=20
> /*
>  * Copyright Ty Coon, 2012.
>  *=20
>  * All Rights Reserved.
>  *
>  * SPDX-License-Identifier: GPL-2.0
>  */

Aren't these differences already present in the header?

>=20
> As far as I know, there is no case law on point about whether or not
> SPDX-License-Identifier has legal significance, or whether the court
> would consider that to be a valid copyright permission statement.  So
> any "answers" made by any lawyer would be guesses.  Of course, an
> guess by a lawyer which is retained by *you* or your company and fully
> informed with the unique parameters of your situation would constitute
> legal advice.  Anything else, including anything any of us could say
> on this mailing list, would be biovating.  :-)

I think make sense to wait for Wolfgang about his experience because
I believe he has considered it before u-boot change.

BTW: Isn't this a good topic for kernel-summit? :-)

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--ehuHqNk3iLxT31GSeNWqi616QXPxdrd86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlMLUS0ACgkQykllyylKDCFXqACaA6p1SNuBv18vesRJy8u2E+r3
0ioAn1WFhVbZX+z4Pz39/HaxLE6yFmcW
=VF8i
-----END PGP SIGNATURE-----

--ehuHqNk3iLxT31GSeNWqi616QXPxdrd86--
