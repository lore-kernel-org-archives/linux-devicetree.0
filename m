From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 09/11] Documentation: devicetree: Fix ADI AXI SPDIF
 specification
Date: Fri, 25 Jul 2014 10:08:06 +0200
Message-ID: <53D21066.8000905@monstr.eu>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-10-git-send-email-afaerber@suse.de> <53D20A61.1050506@metafoo.de>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="RrajogSaff2QDGD0oIQ04L1NxAEkhqCO5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53D20A61.1050506@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RrajogSaff2QDGD0oIQ04L1NxAEkhqCO5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On 07/25/2014 09:42 AM, Lars-Peter Clausen wrote:
> On 07/25/2014 01:00 AM, Andreas F=C3=A4rber wrote:
>> The specification requires compatible =3D "adi,axi-spdif-1.00.a" but
>> driver and example and file name indicate "adi,axi-spdif-tx-1.00.a".
>> Change the specification to match the implementation.
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> Acked-by: Lars-Peter Clausen <lars@metafoo.de>

All these patches have been added through your tree that's why I think
you should take this fix through his tree.

Here is my:
Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--RrajogSaff2QDGD0oIQ04L1NxAEkhqCO5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPSEGYACgkQykllyylKDCH7SwCfay4U16Umhz1wj3S8vUJLvX8W
YEcAn07n5CzkXi+NgYPnuRjjhG5PnaSU
=2CQx
-----END PGP SIGNATURE-----

--RrajogSaff2QDGD0oIQ04L1NxAEkhqCO5--
